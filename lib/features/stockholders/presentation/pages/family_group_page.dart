import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/widgets/page_head.dart';
import '../../../../core/presentation/widgets/scrollable_table.dart';
import '../../../../core/presentation/widgets/status_pill.dart';
import '../../../../core/presentation/widgets/table_head.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../domain/entities/family_group.dart';
import '../../domain/usecases/create_family_group_use_case.dart';
import '../../domain/usecases/get_family_group_members_use_case.dart';
import '../../domain/usecases/get_family_groups_use_case.dart';
import '../bloc/family_group_cubit.dart';
import '../bloc/family_group_state.dart';

/// Family-group inquiry (MDM-002-FG, OI-15).
///
/// Combined shareholdings come from S2's holding ledger, which arrives in Wave 2. Until then the
/// column reads "Pending" rather than 0, so nobody mistakes a missing figure for a real one.
class FamilyGroupPage extends StatelessWidget {
  const FamilyGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FamilyGroupCubit(
        getIt<GetFamilyGroupsUseCase>(),
        getIt<GetFamilyGroupMembersUseCase>(),
        getIt<CreateFamilyGroupUseCase>(),
      ),
      child: const _FamilyGroupView(),
    );
  }
}

class _FamilyGroupView extends StatelessWidget {
  const _FamilyGroupView();

  Future<void> _addGroup(BuildContext context) async {
    final cubit = context.read<FamilyGroupCubit>();
    final t = Translations.of(context);
    final controller = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(t.familyGroups.addDialogTitle),
        content: SizedBox(
          width: 380,
          child: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(labelText: t.familyGroups.fieldName, hintText: t.familyGroups.fieldNameHint),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(t.common.cancel)),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(controller.text.trim()),
            child: Text(t.common.save),
          ),
        ],
      ),
    );
    controller.dispose();
    if (name == null || name.isEmpty || !context.mounted) return;
    final created = await cubit.addGroup(name);
    if (!context.mounted) return;
    final messenger = ScaffoldMessenger.of(context);
    messenger.showSnackBar(SnackBar(
      content: Text(created != null
          ? 'Family group ${created.id} created'
          : 'Could not create the family group — check your permissions'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHead(
          title: t.familyGroups.pageTitle,
          description: t.familyGroups.pageDescription,
          actions: [
            FilledButton.icon(
              onPressed: () => _addGroup(context),
              icon: const Icon(Icons.add),
              label: Text(t.familyGroups.addGroup),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(width: 300, child: _groupList(context, t)),
              const SizedBox(width: 16),
              Expanded(child: _memberList(context, t)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _groupList(BuildContext context, Translations t) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: BlocBuilder<FamilyGroupCubit, FamilyGroupPageState>(
        builder: (context, state) {
          switch (state.status) {
            case FamilyGroupListStatus.initial:
            case FamilyGroupListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case FamilyGroupListStatus.failure:
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(t.familyGroups.loadError, style: const TextStyle(color: AppTokens.red400)),
                ),
              );
            case FamilyGroupListStatus.success:
              final groups = state.groups;
              if (groups.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(t.familyGroups.emptyGroups, textAlign: TextAlign.center),
                  ),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TableHead(label: 'Groups', count: groups.length),
                  Expanded(
                    child: ListView(
                      children: [
                        for (final g in groups)
                          ListTile(
                            selected: state.selected?.id == g.id,
                            selectedTileColor: AppTokens.grey100,
                            leading: const Icon(Icons.group_outlined, size: 20),
                            title: Text(g.name, style: const TextStyle(fontSize: 14)),
                            subtitle: Text(g.id, style: const TextStyle(fontSize: 13, color: AppTokens.grey700)),
                            onTap: () => context.read<FamilyGroupCubit>().select(g),
                          ),
                      ],
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }

  Widget _memberList(BuildContext context, Translations t) {
    return BlocBuilder<FamilyGroupCubit, FamilyGroupPageState>(
      builder: (context, state) {
        final selected = state.selected;
        if (selected == null) {
          return Card(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(t.familyGroups.chooseGroupPrompt),
              ),
            ),
          );
        }
        return Card(
          clipBehavior: Clip.antiAlias,
          child: switch (state.membersStatus) {
            FamilyGroupMembersStatus.idle ||
            FamilyGroupMembersStatus.loading =>
              const Center(child: CircularProgressIndicator()),
            FamilyGroupMembersStatus.failure => Center(
                child: Text(t.familyGroups.loadMembersError, style: const TextStyle(color: AppTokens.red400)),
              ),
            FamilyGroupMembersStatus.success => _membersTable(context, t, selected, state.members),
          },
        );
      },
    );
  }

  Widget _membersTable(BuildContext context, Translations t, FamilyGroup selected, List members) {
    final known = members.where((m) => m.sharesHeld != null);
    final combined = known.fold<int>(0, (sum, m) => sum + (m.sharesHeld as int));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TableHead(label: '${selected.name} · members', count: members.length),
        Expanded(
          child: members.isEmpty
              ? Center(child: Text(t.familyGroups.emptyMembers))
              : ScrollableTable(
                  child: DataTable(
                    headingTextStyle: const TextStyle(
                        fontFamily: AppTokens.fontFamily, fontSize: 14, fontWeight: FontWeight.w600),
                    dataTextStyle: const TextStyle(fontSize: 14),
                    columns: [
                      DataColumn(label: Text(t.common.code)),
                      DataColumn(label: Text(t.common.name)),
                      DataColumn(label: Text(t.stockholders.colType)),
                      DataColumn(label: Text(t.common.status)),
                      DataColumn(label: Text(t.familyGroups.colSharesHeld), numeric: true),
                    ],
                    rows: [
                      for (final m in members)
                        DataRow(cells: [
                          DataCell(Text(m.stockholderCode)),
                          DataCell(Text(m.name)),
                          DataCell(Text(m.type)),
                          DataCell(StatusPill.stockholder(
                              active: m.active, activeLabel: 'Active', inactiveLabel: 'Inactive')),
                          DataCell(Text(m.sharesHeld?.toString() ?? t.familyGroups.pendingShares)),
                        ]),
                    ],
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            known.isEmpty
                ? t.familyGroups.combinedPending
                : t.familyGroups.combinedSummary(
                    combined: '$combined', known: '${known.length}', total: '${members.length}'),
            style: const TextStyle(fontSize: 13, color: AppTokens.grey700),
          ),
        ),
      ],
    );
  }
}
