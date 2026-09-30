import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/widgets/app_shell.dart';
import '../../../../core/presentation/widgets/status_pill.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../../auth/presentation/bloc/session_cubit.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/usecases/get_transaction_use_case.dart';
import '../../domain/usecases/transaction_action_use_cases.dart';
import '../bloc/transaction_detail_cubit.dart';
import '../bloc/transaction_detail_state.dart';
import 'transaction_status_labels.dart';

/// Transaction detail + approval actions. Shows the computed transferor/transferee breakdown
/// (TR-003), the approval history and the actions available for the current status and role.
class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionDetailCubit(
        id,
        getIt<GetTransactionUseCase>(),
        getIt<SubmitTransactionUseCase>(),
        getIt<ApproveTransactionUseCase>(),
        getIt<RejectTransactionUseCase>(),
        getIt<MarkTransactionPrintedUseCase>(),
      ),
      child: _TransactionDetailView(id: id),
    );
  }
}

class _TransactionDetailView extends StatelessWidget {
  const _TransactionDetailView({required this.id});

  final String id;

  Future<String?> _askReason(BuildContext context, String title, {required bool required}) {
    final controller = TextEditingController();
    final t = Translations.of(context);
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLines: 2,
          decoration: InputDecoration(
            labelText: required ? t.transactions.reasonRequired : t.transactions.reasonOptional,
            hintText: t.transactions.reasonHint,
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(null), child: Text(t.common.cancel)),
          FilledButton(
            onPressed: () {
              final text = controller.text.trim();
              if (required && text.isEmpty) return;
              Navigator.of(ctx).pop(text);
            },
            child: Text(t.common.confirm),
          ),
        ],
      ),
    );
  }

  Future<void> _runAction(
      BuildContext context, Future<String?> Function() action, String okMessage) async {
    final messenger = ScaffoldMessenger.of(context);
    final at = TimeOfDay.now().format(context); // capture before the async gap
    final error = await action();
    if (error == null) {
      messenger.showSnackBar(SnackBar(content: Text('$okMessage at $at.')));
    } else {
      messenger.showSnackBar(SnackBar(content: Text(error)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return AppShell(
      title: 'Transaction $id',
      activeNav: t.nav.transactions,
      child: BlocBuilder<TransactionDetailCubit, TransactionDetailState>(
        builder: (context, state) {
          switch (state.status) {
            case TransactionDetailStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case TransactionDetailStatus.failure:
              return Center(
                child: Text('${t.transactions.loadDetailError}\n${state.errorMessage}',
                    textAlign: TextAlign.center, style: const TextStyle(color: AppTokens.red400)),
              );
            case TransactionDetailStatus.success:
              final tx = state.transaction!;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () => Navigator.of(context).pop(state.changed),
                        icon: const Icon(Icons.arrow_back),
                        label: Text(t.transactions.backToList),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _header(context, t, tx, state.isActionRunning),
                    const SizedBox(height: 16),
                    _breakdownCard(t, tx),
                    const SizedBox(height: 16),
                    _linesCard(t, tx),
                    const SizedBox(height: 16),
                    _approvalsCard(t, tx),
                  ],
                ),
              );
          }
        },
      ),
    );
  }

  Widget _header(BuildContext context, Translations t, Transaction tx, bool busy) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('${tx.id} · ${tx.transferType}',
                      style: const TextStyle(
                          fontFamily: AppTokens.fontFamily, fontSize: 22, fontWeight: FontWeight.w600)),
                ),
                StatusPill.transaction(tx.status, transactionStatusLabel(t, tx.status)),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(spacing: 24, runSpacing: 4, children: [
              _meta(t.transactions.metaCompany, tx.companyCode),
              _meta(t.transactions.metaDate, tx.transactionDate),
              _meta(t.transactions.metaSrf, tx.srfNo ?? t.common.notAvailable),
              _meta(t.transactions.metaType, tx.type),
              if (tx.exception) _meta(t.transactions.metaException, 'Override / void'),
              if (tx.postedAt != null) _meta(t.transactions.metaPostedAt, tx.postedAt!),
            ]),
            if ((tx.remarks ?? '').isNotEmpty) ...[
              const SizedBox(height: 8),
              Text('Remarks: ${tx.remarks}', style: const TextStyle(color: AppTokens.grey700)),
            ],
            const SizedBox(height: 16),
            _actions(context, t, tx, busy),
          ],
        ),
      ),
    );
  }

  Widget _actions(BuildContext context, Translations t, Transaction tx, bool busy) {
    final role = context.select((SessionCubit c) => c.state.role) ?? '';
    final cubit = context.read<TransactionDetailCubit>();
    final buttons = <Widget>[];

    bool anyOf(List<String> roles) => roles.contains(role);

    switch (tx.status) {
      case 'Submitted':
        if (anyOf(['User', 'Admin'])) {
          buttons.add(FilledButton.icon(
            onPressed: busy ? null : () => _runAction(context, cubit.submit, 'Submitted for approval'),
            icon: const Icon(Icons.send),
            label: Text(t.transactions.submitForApproval),
          ));
        }
        break;
      case 'PendingFirstApproval':
      case 'PendingSecondApproval':
        final l2 = tx.status == 'PendingSecondApproval';
        final canApprove =
            l2 ? anyOf(['SecondLevelApprover', 'TeamLeader', 'Admin']) : anyOf(['FirstLevelApprover', 'Admin']);
        if (canApprove) {
          buttons.add(FilledButton.icon(
            onPressed: busy
                ? null
                : () async {
                    String? reason;
                    if (tx.exception) {
                      reason = await _askReason(context, 'Approve override/void', required: true);
                      if (reason == null) return;
                    }
                    if (!context.mounted) return;
                    await _runAction(context, () => cubit.approve(reason: reason), 'Approved');
                  },
            icon: const Icon(Icons.check),
            label: Text(l2 ? t.transactions.approveSecondLevel : t.transactions.approve),
          ));
          buttons.add(OutlinedButton.icon(
            onPressed: busy
                ? null
                : () async {
                    final reason = await _askReason(context, 'Reject transaction', required: true);
                    if (reason == null) return;
                    if (!context.mounted) return;
                    await _runAction(context, () => cubit.reject(reason: reason), 'Rejected');
                  },
            icon: const Icon(Icons.close),
            label: Text(t.transactions.reject),
          ));
        }
        break;
      case 'Approved':
        if (anyOf(['TeamLeader', 'Admin'])) {
          buttons.add(FilledButton.icon(
            onPressed: busy ? null : () => _runAction(context, cubit.markPrinted, 'Posted (print complete)'),
            icon: const Icon(Icons.print),
            label: Text(t.transactions.markPrinted),
          ));
        }
        break;
      default:
        break;
    }

    if (buttons.isEmpty) {
      return Text(t.transactions.noActions, style: const TextStyle(color: AppTokens.grey700));
    }
    return Wrap(spacing: 12, runSpacing: 8, children: buttons);
  }

  Widget _breakdownCard(Translations t, Transaction tx) {
    return _sectionCard(
      t.transactions.breakdownTitle,
      DataTable(
        columns: const [
          DataColumn(label: Text('Stockholder')),
          DataColumn(label: Text('Share class')),
          DataColumn(label: Text('Before'), numeric: true),
          DataColumn(label: Text('Change'), numeric: true),
          DataColumn(label: Text('After'), numeric: true),
        ],
        rows: [
          for (final b in tx.breakdown)
            DataRow(cells: [
              DataCell(Text(b.stockholderCode)),
              DataCell(Text(b.shareClassId)),
              DataCell(Text('${b.sharesBefore}')),
              DataCell(Text(b.delta >= 0 ? '+${b.delta}' : '${b.delta}')),
              DataCell(Text('${b.sharesAfter}')),
            ]),
        ],
      ),
    );
  }

  Widget _linesCard(Translations t, Transaction tx) {
    return _sectionCard(
      t.transactions.linesTitle,
      DataTable(
        columns: const [
          DataColumn(label: Text('From')),
          DataColumn(label: Text('To')),
          DataColumn(label: Text('Share class')),
          DataColumn(label: Text('Shares'), numeric: true),
          DataColumn(label: Text('Certificate')),
        ],
        rows: [
          for (final l in tx.lines)
            DataRow(cells: [
              DataCell(Text(l.fromStockholderCode)),
              DataCell(Text(l.toStockholderCode)),
              DataCell(Text(l.shareClassId)),
              DataCell(Text('${l.shares}')),
              DataCell(Text(l.sourceCertificateNumber)),
            ]),
        ],
      ),
    );
  }

  Widget _approvalsCard(Translations t, Transaction tx) {
    if (tx.approvals.isEmpty) {
      return _sectionCard(t.transactions.approvalsTitle, Text(t.transactions.noApprovals));
    }
    return _sectionCard(
      t.transactions.approvalsTitle,
      DataTable(
        columns: const [
          DataColumn(label: Text('Level')),
          DataColumn(label: Text('Required role')),
          DataColumn(label: Text('Decision')),
          DataColumn(label: Text('Actor')),
          DataColumn(label: Text('Reason')),
        ],
        rows: [
          for (final a in tx.approvals)
            DataRow(cells: [
              DataCell(Text('${a.level}')),
              DataCell(Text(a.requiredRole)),
              DataCell(Text(a.decision)),
              DataCell(Text(a.actor ?? '—')),
              DataCell(Text(a.reason ?? '—')),
            ]),
        ],
      ),
    );
  }

  Widget _sectionCard(String title, Widget body) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontFamily: AppTokens.fontFamily, fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 12),
            SizedBox(width: double.infinity, child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: body)),
          ],
        ),
      ),
    );
  }

  Widget _meta(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(color: AppTokens.grey700, fontSize: 12)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
