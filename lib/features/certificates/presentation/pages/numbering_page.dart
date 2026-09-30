import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/widgets/inline_message_box.dart';
import '../../../../core/presentation/widgets/page_head.dart';
import '../../../../core/presentation/widgets/section_card.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../domain/usecases/numbering_use_cases.dart';
import '../../domain/usecases/reference_use_cases.dart';
import '../bloc/numbering_cubit.dart';
import '../bloc/numbering_state.dart';
import '../widgets/numbering_edit_dialog.dart';

/// SL-002 Settings › Stock certificate configuration.
class NumberingPage extends StatelessWidget {
  const NumberingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NumberingCubit(
        getIt<GetCertificateCompaniesUseCase>(),
        getIt<GetShareClassesForCompanyUseCase>(),
        getIt<GetNumberingUseCase>(),
        getIt<SetNumberingUseCase>(),
      ),
      child: const _NumberingView(),
    );
  }
}

class _NumberingView extends StatelessWidget {
  const _NumberingView();

  Future<void> _edit(BuildContext context, ClassNumbering row) async {
    await showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<NumberingCubit>(),
        child: NumberingEditDialog(shareClass: row.shareClass, current: row.config),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BreadcrumbPageHead(
            breadcrumb: t.certificates.numberingBreadcrumb,
            title: t.certificates.numberingTitle,
            description: t.certificates.numberingDescription,
          ),
          const SizedBox(height: 16),
          BlocBuilder<NumberingCubit, NumberingState>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 520,
                  child: DropdownButtonFormField<String>(
                    initialValue: state.companyCode,
                    isExpanded: true,
                    decoration: InputDecoration(labelText: t.certificates.companyLabel),
                    items: [
                      for (final e in state.companies.entries)
                        DropdownMenuItem(value: e.key, child: Text('${e.key} · ${e.value}')),
                    ],
                    onChanged: (v) {
                      if (v == null || v == state.companyCode) return;
                      context.read<NumberingCubit>().selectCompany(v);
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          BlocBuilder<NumberingCubit, NumberingState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.successMessage != null) SuccessBox(state.successMessage!),
                  SectionCard(
                    title: 'Sequences · ${state.companies[state.companyCode] ?? state.companyCode ?? ''}',
                    child: switch (state.status) {
                      NumberingStatus.initial || NumberingStatus.loading => const Padding(
                          padding: EdgeInsets.all(24),
                          child: Row(children: [
                            SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)),
                            SizedBox(width: 12),
                            Text('Loading certificate sequences…'),
                          ]),
                        ),
                      NumberingStatus.failure => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ErrorBox('${t.certificates.loadSequencesError} ${state.errorMessage ?? ''}'),
                            const SizedBox(height: 8),
                            OutlinedButton(
                                onPressed: () => context.read<NumberingCubit>().reload(),
                                child: Text(t.common.tryAgain)),
                          ],
                        ),
                      NumberingStatus.success => state.rows.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(t.certificates.noShareClasses),
                            )
                          : _SequenceTable(rows: state.rows, onEdit: (row) => _edit(context, row)),
                    },
                  ),
                  Text(t.certificates.footNote,
                      style: const TextStyle(color: AppTokens.grey700, fontSize: 13)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SequenceTable extends StatelessWidget {
  const _SequenceTable({required this.rows, required this.onEdit});

  final List<ClassNumbering> rows;
  final ValueChanged<ClassNumbering> onEdit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(AppTokens.blue100),
        columns: [
          DataColumn(label: Text(t.certificates.colShareClass)),
          DataColumn(label: Text(t.certificates.colSequence)),
          DataColumn(label: Text(t.certificates.colStartingNumber)),
          DataColumn(label: Text(t.certificates.colNextNumber)),
          DataColumn(label: Text(t.certificates.colNumberingMode)),
          DataColumn(label: Text(t.common.actions)),
        ],
        rows: [
          for (final r in rows) ...[
            DataRow(cells: [
              DataCell(Text(r.shareClass.stockType)),
              DataCell(Text(t.certificates.originalIssuance)),
              DataCell(Text(r.config.originalStart)),
              DataCell(Text(r.config.nextOriginal)),
              DataCell(Text(r.config.mode.wire)),
              DataCell(TextButton.icon(
                key: Key('edit-${r.shareClass.id}'),
                onPressed: () => onEdit(r),
                icon: const Icon(Icons.edit_outlined, size: 18),
                label: Text(t.common.edit, semanticsLabel: 'Edit numbering for ${r.shareClass.stockType}'),
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(r.shareClass.stockType)),
              DataCell(Text(t.certificates.replacementSeparate)),
              DataCell(Text(r.config.replacementStart)),
              DataCell(Text(r.config.nextReplacement)),
              DataCell(Text(r.config.mode.wire)),
              const DataCell(SizedBox.shrink()),
            ]),
          ],
        ],
      ),
    );
  }
}
