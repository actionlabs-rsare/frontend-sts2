import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/widgets/app_shell.dart';
import '../../../../core/presentation/widgets/async_error_view.dart';
import '../../../../core/presentation/widgets/status_pill.dart';
import '../../../../core/router/route_paths.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../domain/usecases/get_transaction_report_use_case.dart';
import '../../domain/usecases/get_transactions_use_case.dart';
import '../bloc/transaction_list_cubit.dart';
import '../bloc/transaction_list_state.dart';
import 'transaction_status_labels.dart';

/// Transactions list. Entry point for the transactions feature — lists transfers with their
/// status, opens the add-transfer flow and the per-transaction detail/approval view.
class TransactionsListPage extends StatelessWidget {
  const TransactionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionListCubit(getIt<GetTransactionsUseCase>(), getIt<GetTransactionReportUseCase>()),
      child: const _TransactionsListView(),
    );
  }
}

class _TransactionsListView extends StatelessWidget {
  const _TransactionsListView();

  Future<void> _downloadReport(BuildContext context) async {
    final cubit = context.read<TransactionListCubit>();
    final messenger = ScaffoldMessenger.of(context);
    final at = TimeOfDay.now().format(context); // capture before the async gap
    final bytes = await cubit.downloadReport();
    if (bytes == null) {
      messenger.showSnackBar(const SnackBar(content: Text('Could not generate the report.')));
      return;
    }
    messenger.showSnackBar(
      SnackBar(content: Text('Transaction report generated (PDF, ${bytes.length} bytes) at $at.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return AppShell(
      title: t.transactions.pageTitle,
      activeNav: t.nav.transactions,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(t.transactions.pageTitle,
                    style: const TextStyle(
                        fontFamily: AppTokens.fontFamily, fontSize: 24, fontWeight: FontWeight.w600)),
              ),
              OutlinedButton.icon(
                onPressed: () => _downloadReport(context),
                icon: const Icon(Icons.picture_as_pdf_outlined),
                label: Text(t.transactions.reportButton),
              ),
              const SizedBox(width: 12),
              FilledButton.icon(
                onPressed: () => context.push(RoutePaths.transactionAdd),
                icon: const Icon(Icons.add),
                label: Text(t.transactions.addButton),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Card(
              child: BlocBuilder<TransactionListCubit, TransactionListState>(
                builder: (context, state) {
                  switch (state.status) {
                    case TransactionListStatus.initial:
                    case TransactionListStatus.loading:
                      return const Center(child: CircularProgressIndicator());
                    case TransactionListStatus.failure:
                      return AsyncErrorView(
                        message: t.transactions.loadError,
                        onRetry: () => context.read<TransactionListCubit>().load(),
                      );
                    case TransactionListStatus.success:
                      final txns = state.transactions;
                      if (txns.isEmpty) {
                        return Center(child: Text(t.transactions.empty));
                      }
                      return SingleChildScrollView(
                        child: SizedBox(
                          width: double.infinity,
                          child: DataTable(
                            showCheckboxColumn: false,
                            columns: [
                              DataColumn(label: Text(t.transactions.colReference)),
                              DataColumn(label: Text(t.transactions.colCompany)),
                              DataColumn(label: Text(t.transactions.colTransferType)),
                              DataColumn(label: Text(t.transactions.colDate)),
                              DataColumn(label: Text(t.common.status)),
                            ],
                            rows: [
                              for (final tx in txns)
                                DataRow(
                                  onSelectChanged: (_) =>
                                      context.push(RoutePaths.transactionDetailPath(tx.id)),
                                  cells: [
                                    DataCell(Text(tx.id)),
                                    DataCell(Text(tx.companyCode)),
                                    DataCell(Text(tx.transferType)),
                                    DataCell(Text(tx.transactionDate)),
                                    DataCell(StatusPill.transaction(tx.status, transactionStatusLabel(t, tx.status))),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
