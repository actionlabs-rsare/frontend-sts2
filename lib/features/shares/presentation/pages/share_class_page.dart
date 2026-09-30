import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/widgets/async_error_view.dart';
import '../../../../core/presentation/widgets/page_head.dart';
import '../../../../core/presentation/widgets/scrollable_table.dart';
import '../../../../core/presentation/widgets/table_head.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../i18n/strings.g.dart';
import '../../../companies/domain/usecases/get_companies_use_case.dart';
import '../../domain/entities/share_class.dart';
import '../../domain/usecases/get_share_classes_use_case.dart';
import '../bloc/share_class_list_cubit.dart';
import '../bloc/share_class_list_state.dart';
import '../widgets/share_class_form_dialog.dart';

/// Company share maintenance (MDM-003).
class ShareClassPage extends StatelessWidget {
  const ShareClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShareClassListCubit(getIt<GetCompaniesUseCase>(), getIt<GetShareClassesUseCase>()),
      child: const _ShareClassView(),
    );
  }
}

class _ShareClassView extends StatelessWidget {
  const _ShareClassView();

  Future<void> _openForm(BuildContext context, String companyCode, {ShareClass? existing}) async {
    final cubit = context.read<ShareClassListCubit>();
    final saved = await showDialog<ShareClass>(
      context: context,
      builder: (_) => ShareClassFormDialog(companyCode: companyCode, existing: existing),
    );
    if (saved == null || !context.mounted) return;
    showActionSnack(
      context,
      existing == null
          ? 'Share class ${saved.id} (${saved.stockType}) created with its own numbering sequence'
          : 'Share class ${saved.id} updated',
    );
    cubit.reload();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<ShareClassListCubit, ShareClassListState>(
          builder: (context, state) {
            return PageHead(
              title: t.shares.pageTitle,
              description: t.shares.pageDescription,
              actions: [
                FilledButton.icon(
                  onPressed: state.companyCode == null
                      ? null
                      : () => _openForm(context, state.companyCode!),
                  icon: const Icon(Icons.add),
                  label: Text(t.common.add),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<ShareClassListCubit, ShareClassListState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: state.companyCode,
                        isExpanded: true,
                        decoration: InputDecoration(labelText: t.shares.companyLabel),
                        items: [
                          for (final c in state.companies)
                            DropdownMenuItem(value: c.companyCode, child: Text('${c.companyCode} · ${c.name}')),
                        ],
                        onChanged: (v) {
                          if (v == null) return;
                          context.read<ShareClassListCubit>().selectCompany(v);
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    FilledButton(
                      onPressed: () => context.read<ShareClassListCubit>().reload(),
                      child: Text(t.common.search),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: BlocBuilder<ShareClassListCubit, ShareClassListState>(
              builder: (context, state) {
                switch (state.status) {
                  case ShareClassListStatus.initial:
                  case ShareClassListStatus.loading:
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(height: 12),
                          Text(t.shares.loading),
                        ],
                      ),
                    );
                  case ShareClassListStatus.failure:
                    return AsyncErrorView(
                      message: t.shares.loadError,
                      onRetry: () => context.read<ShareClassListCubit>().reload(),
                    );
                  case ShareClassListStatus.success:
                    final rows = state.shareClasses;
                    final companyCode = state.companyCode ?? '';
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TableHead(label: 'Share classes · $companyCode', count: rows.length),
                        Expanded(
                          child: rows.isEmpty
                              ? _empty(context, t, companyCode)
                              : _table(context, rows),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(t.shares.footNote,
                              style: const TextStyle(fontSize: 13, color: AppTokens.grey700)),
                        ),
                      ],
                    );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _empty(BuildContext context, Translations t, String companyCode) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$companyCode has no share classes yet.'),
          const SizedBox(height: 4),
          Text(t.shares.emptySubtitle, style: const TextStyle(color: AppTokens.grey700)),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => _openForm(context, companyCode),
            icon: const Icon(Icons.add),
            label: Text(t.common.add),
          ),
        ],
      ),
    );
  }

  Widget _table(BuildContext context, List<ShareClass> rows) {
    final t = Translations.of(context);
    return ScrollableTable(
      child: DataTable(
        headingTextStyle: const TextStyle(
            fontFamily: AppTokens.fontFamily, fontSize: 14, fontWeight: FontWeight.w600),
        dataTextStyle: const TextStyle(fontSize: 14),
        columns: [
          DataColumn(label: Text(t.shares.colStockType)),
          DataColumn(label: Text(t.shares.colParValue), numeric: true),
          DataColumn(label: Text(t.shares.colAuthorized), numeric: true),
          DataColumn(label: Text(t.shares.colSubscribed), numeric: true),
          DataColumn(label: Text(t.shares.colIssued), numeric: true),
          DataColumn(label: Text(t.shares.colTreasury), numeric: true),
          DataColumn(label: Text(t.shares.colTotalAmount), numeric: true),
          DataColumn(label: Text(t.shares.colNextCert), numeric: true),
          DataColumn(label: Text(t.common.actions)),
        ],
        rows: [
          for (final sc in rows)
            DataRow(cells: [
              DataCell(Text(sc.stockType)),
              DataCell(Text(formatPeso(sc.parValue))),
              DataCell(Text(formatCount(sc.authorizedShares))),
              DataCell(Text(formatCount(sc.subscribedShares))),
              DataCell(Text(formatCount(sc.issuedShares))),
              DataCell(Text(formatCount(sc.treasuryShares))),
              DataCell(Text(formatPeso(sc.totalAmount))),
              DataCell(Tooltip(
                message: "From this class's own sequence (SL-002)",
                child: Text(sc.nextCertificateNumber ?? t.common.notAvailable),
              )),
              DataCell(IconButton(
                tooltip: t.common.edit,
                icon: const Icon(Icons.edit_outlined, size: 18),
                onPressed: () => _openForm(context, sc.companyCode, existing: sc),
              )),
            ]),
        ],
      ),
    );
  }
}
