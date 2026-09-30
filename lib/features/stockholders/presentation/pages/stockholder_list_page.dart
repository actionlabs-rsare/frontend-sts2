import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/widgets/async_error_view.dart';
import '../../../../core/presentation/widgets/page_head.dart';
import '../../../../core/presentation/widgets/scrollable_table.dart';
import '../../../../core/presentation/widgets/status_pill.dart';
import '../../../../core/presentation/widgets/table_head.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../i18n/strings.g.dart';
import '../../domain/entities/stockholder.dart';
import '../../domain/usecases/deactivate_stockholder_use_case.dart';
import '../../domain/usecases/get_family_groups_use_case.dart';
import '../../domain/usecases/get_stockholders_use_case.dart';
import '../bloc/stockholder_list_cubit.dart';
import '../bloc/stockholder_list_state.dart';
import '../widgets/stockholder_form_dialog.dart';

/// Stockholder maintenance (MDM-002) — list, add, edit, deactivate.
///
/// Two deliberate differences from the mockup, both from binding decisions: the TIN column is
/// masked (personal data), and the red delete row action is replaced by **Deactivate** because
/// records are never deleted (OI-19).
class StockholderListPage extends StatelessWidget {
  const StockholderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StockholderListCubit(
        getIt<GetStockholdersUseCase>(),
        getIt<GetFamilyGroupsUseCase>(),
        getIt<DeactivateStockholderUseCase>(),
      ),
      child: const _StockholderListView(),
    );
  }
}

class _StockholderListView extends StatefulWidget {
  const _StockholderListView();

  @override
  State<_StockholderListView> createState() => _StockholderListViewState();
}

class _StockholderListViewState extends State<_StockholderListView> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  Future<void> _openForm(BuildContext context, {Stockholder? existing}) async {
    final cubit = context.read<StockholderListCubit>();
    final saved = await showDialog<Stockholder>(
      context: context,
      builder: (_) => StockholderFormDialog(familyGroups: cubit.state.familyGroups, existing: existing),
    );
    if (saved == null || !context.mounted) return;
    showActionSnack(
      context,
      existing == null
          ? 'Stockholder ${saved.stockholderCode} created'
          : 'Stockholder ${saved.stockholderCode} updated',
    );
    cubit.load();
  }

  Future<void> _confirmDeactivate(BuildContext context, Stockholder s) async {
    final cubit = context.read<StockholderListCubit>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Deactivate this stockholder?'),
        content: Text(
          '${s.stockholderCode} — ${s.name}\n\n'
          'The record stays in the system with its full history; it is marked inactive and '
          'excluded from new transactions. Stock Transfer never deletes records.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Deactivate')),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    final ok = await cubit.deactivate(s);
    if (!context.mounted) return;
    showActionSnack(
      context,
      ok
          ? 'Stockholder ${s.stockholderCode} deactivated'
          : 'Could not deactivate ${s.stockholderCode} — check your permissions',
    );
  }

  void _showDetail(BuildContext context, Stockholder s, Translations t) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('${s.stockholderCode} — ${s.name}'),
        content: SizedBox(
          width: 460,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _detailRow(t.stockholders.detailType, s.type),
              _detailRow(t.stockholders.detailNationality, s.nationalityLabel),
              _detailRow(t.stockholders.detailGender, s.gender),
              _detailRow(t.stockholders.detailTin, s.tin),
              _detailRow(t.stockholders.detailEmail, s.email),
              _detailRow(t.stockholders.detailMobile, s.mobile ?? t.common.notAvailable),
              _detailRow(t.stockholders.detailAddress, s.address ?? t.common.notAvailable),
              _detailRow(t.stockholders.detailFamilyGroup, s.familyGroupId ?? t.common.none),
              _detailRow(t.stockholders.detailStatus, s.active ? 'Active' : 'Inactive'),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(t.common.close)),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 130, child: Text(label, style: const TextStyle(fontSize: 14, color: AppTokens.grey700))),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHead(
          title: t.stockholders.pageTitle,
          description: t.stockholders.pageDescription,
          actions: [
            FilledButton.icon(
              onPressed: () => _openForm(context),
              icon: const Icon(Icons.add),
              label: Text(t.common.add),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _search,
                    onSubmitted: (_) => context.read<StockholderListCubit>().load(q: _search.text.trim()),
                    decoration: InputDecoration(
                      labelText: t.common.search,
                      hintText: t.stockholders.searchHint,
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () {
                    _search.clear();
                    context.read<StockholderListCubit>().load(q: '');
                  },
                  child: Text(t.common.clear),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () => context.read<StockholderListCubit>().load(q: _search.text.trim()),
                  child: Text(t.common.search),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: BlocBuilder<StockholderListCubit, StockholderListState>(
              builder: (context, state) {
                switch (state.status) {
                  case StockholderListStatus.initial:
                  case StockholderListStatus.loading:
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(height: 12),
                          Text(t.stockholders.loading),
                        ],
                      ),
                    );
                  case StockholderListStatus.failure:
                    return AsyncErrorView(
                      message: t.stockholders.loadError,
                      hint: t.stockholders.loadErrorHint,
                      onRetry: () => context.read<StockholderListCubit>().load(),
                    );
                  case StockholderListStatus.success:
                    final rows = state.stockholders;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TableHead(label: 'All stockholders', count: rows.length),
                        Expanded(child: rows.isEmpty ? _empty(context, t) : _table(context, t, rows)),
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

  Widget _empty(BuildContext context, Translations t) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(t.stockholders.emptyTitle),
          const SizedBox(height: 4),
          Text(t.stockholders.emptySubtitle, style: const TextStyle(color: AppTokens.grey700)),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => _openForm(context),
            icon: const Icon(Icons.add),
            label: Text(t.common.add),
          ),
        ],
      ),
    );
  }

  Widget _table(BuildContext context, Translations t, List<Stockholder> rows) {
    return ScrollableTable(
      child: DataTable(
        headingTextStyle:
            const TextStyle(fontFamily: AppTokens.fontFamily, fontSize: 14, fontWeight: FontWeight.w600),
        dataTextStyle: const TextStyle(fontSize: 14),
        columns: [
          DataColumn(label: Text(t.common.code)),
          DataColumn(label: Text(t.stockholders.colName)),
          DataColumn(label: Text(t.stockholders.colType)),
          DataColumn(label: Text(t.stockholders.colNationality)),
          DataColumn(label: Text(t.stockholders.colTin)),
          DataColumn(label: Text(t.common.status)),
          DataColumn(label: Text(t.common.actions)),
        ],
        rows: [
          for (final s in rows)
            DataRow(cells: [
              DataCell(Text(s.stockholderCode)),
              DataCell(Text(s.name)),
              DataCell(Text(s.type)),
              DataCell(Text(s.nationalityLabel)),
              DataCell(Tooltip(message: t.stockholders.maskedTinTooltip, child: Text(maskTin(s.tin)))),
              DataCell(StatusPill.stockholder(active: s.active, activeLabel: 'Active', inactiveLabel: 'Inactive')),
              DataCell(Row(
                children: [
                  IconButton(
                    tooltip: t.common.view,
                    icon: const Icon(Icons.visibility_outlined, size: 18),
                    onPressed: () => _showDetail(context, s, t),
                  ),
                  IconButton(
                    tooltip: t.common.edit,
                    icon: const Icon(Icons.edit_outlined, size: 18),
                    onPressed: () => _openForm(context, existing: s),
                  ),
                  IconButton(
                    // No delete action exists anywhere in this system (OI-19).
                    tooltip: s.active ? t.stockholders.deactivateTooltip : t.stockholders.alreadyInactiveTooltip,
                    icon: const Icon(Icons.pause_circle_outline, size: 18),
                    onPressed: s.active ? () => _confirmDeactivate(context, s) : null,
                  ),
                ],
              )),
            ]),
        ],
      ),
    );
  }
}
