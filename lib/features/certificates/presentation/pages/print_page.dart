import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/widgets/inline_message_box.dart';
import '../../../../core/presentation/widgets/page_head.dart';
import '../../../../core/presentation/widgets/section_card.dart';
import '../../../../core/presentation/widgets/status_pill.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../domain/entities/certificate.dart';
import '../../domain/usecases/print_use_cases.dart';
import '../../domain/usecases/reference_use_cases.dart';
import '../bloc/print_cubit.dart';
import '../bloc/print_state.dart';
import '../widgets/print_dialog.dart';
import 'certificate_status_labels.dart';

/// TR-017/TR-018: approved transactions → print → assigned numbers → PDF.
class PrintPage extends StatelessWidget {
  const PrintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrintCubit(
        getIt<GetPrintableTransactionsUseCase>(),
        getIt<GetCertificateCompaniesUseCase>(),
        getIt<ListCertificatesForTransactionUseCase>(),
        getIt<PrintCertificatesUseCase>(),
        getIt<DownloadCertificateDocumentUseCase>(),
      ),
      child: const _PrintView(),
    );
  }
}

class _PrintView extends StatelessWidget {
  const _PrintView();

  Future<void> _print(BuildContext context, PrintableTransactionRef tx, Map<String, String> companies) async {
    final cubit = context.read<PrintCubit>();
    final printed = await showDialog<List<Certificate>>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: PrintDialog(
          transaction: tx,
          subtitle: '${companies[tx.companyCode] ?? tx.companyCode} · ${tx.summary}',
        ),
      ),
    );
    if (printed == null) return;
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BreadcrumbPageHead(
            breadcrumb: t.certificates.printBreadcrumb,
            title: t.certificates.printTitle,
            description: t.certificates.printDescription,
          ),
          const SizedBox(height: 16),
          BlocBuilder<PrintCubit, PrintState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.successMessage != null) SuccessBox(state.successMessage!),
                  if (state.errorMessage != null) ...[
                    ErrorBox(state.errorMessage!),
                    const SizedBox(height: 16),
                  ],
                  SectionCard(
                    title: t.certificates.transactionsToPrint,
                    trailing: Text(t.certificates.sampleDataNote,
                        style: const TextStyle(color: AppTokens.grey700, fontSize: 13)),
                    child: switch (state.status) {
                      PrintTransactionsStatus.initial ||
                      PrintTransactionsStatus.loading =>
                        const Padding(padding: EdgeInsets.all(16), child: LinearProgressIndicator()),
                      PrintTransactionsStatus.failure =>
                        Text('Could not load transactions to print.\n${state.errorMessage ?? ''}'),
                      PrintTransactionsStatus.success => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            headingRowColor: WidgetStateProperty.all(AppTokens.blue100),
                            columns: [
                              DataColumn(label: Text(t.certificates.colReference)),
                              DataColumn(label: Text(t.certificates.colCompany)),
                              DataColumn(label: Text(t.certificates.colDetails)),
                              DataColumn(label: Text(t.common.status)),
                              DataColumn(label: Text(t.common.actions)),
                            ],
                            rows: [
                              for (final tx in state.transactions)
                                DataRow(
                                  selected: state.selected?.id == tx.id,
                                  cells: [
                                    DataCell(Text(tx.id)),
                                    DataCell(Text(tx.companyCode)),
                                    DataCell(Text(tx.summary)),
                                    DataCell(StatusPill.certificate(
                                        tx.status, certificateStatusLabel(t, tx.status))),
                                    DataCell(Row(children: [
                                      TextButton.icon(
                                        key: Key('view-${tx.id}'),
                                        onPressed: () => context.read<PrintCubit>().open(tx),
                                        icon: const Icon(Icons.visibility_outlined, size: 18),
                                        label: Text(t.common.view, semanticsLabel: 'View certificates of ${tx.id}'),
                                      ),
                                      const SizedBox(width: 4),
                                      Tooltip(
                                        message: tx.status == 'Approved'
                                            ? t.certificates.printTooltip(id: tx.id)
                                            : t.certificates.onlyApprovedTooltip,
                                        child: FilledButton.icon(
                                          key: Key('print-${tx.id}'),
                                          onPressed: tx.status == 'Approved'
                                              ? () => _print(context, tx, state.companies)
                                              : null,
                                          icon: const Icon(Icons.print_outlined, size: 18),
                                          label: Text(t.certificates.print,
                                              semanticsLabel: 'Print certificates of ${tx.id}'),
                                        ),
                                      ),
                                    ])),
                                  ],
                                ),
                            ],
                          ),
                        ),
                    },
                  ),
                  if (state.selected != null) _certificatesCard(context, t, state),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _certificatesCard(BuildContext context, Translations t, PrintState state) {
    final tx = state.selected!;
    final list = state.certificates;
    return SectionCard(
      title: t.certificates.certificatesFor(id: tx.id),
      trailing: (state.certificatesStatus == CertificatesStatus.success && list.isNotEmpty)
          ? FilledButton.icon(
              key: const Key('downloadPdf'),
              onPressed: state.isDownloading ? null : () => context.read<PrintCubit>().download(),
              icon: state.isDownloading
                  ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.picture_as_pdf_outlined, size: 18),
              label: Text(state.isDownloading ? t.certificates.preparingPdf : t.certificates.downloadPdf),
            )
          : null,
      child: switch (state.certificatesStatus) {
        CertificatesStatus.idle || CertificatesStatus.loading => Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)),
              const SizedBox(width: 12),
              Text(t.certificates.loadingCertificates),
            ]),
          ),
        CertificatesStatus.failure => Padding(
            padding: const EdgeInsets.all(16),
            child: Text(t.certificates.loadCertificatesError(id: tx.id)),
          ),
        CertificatesStatus.success => list.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: Text(t.certificates.noCertificatesYet(id: tx.id)),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(AppTokens.blue100),
                  columns: [
                    DataColumn(label: Text(t.certificates.colCertNo)),
                    DataColumn(label: Text(t.certificates.colShareClass)),
                    DataColumn(label: Text(t.certificates.colHolderStockholder)),
                    DataColumn(label: Text(t.certificates.colSharesCount), numeric: true),
                    DataColumn(label: Text(t.common.status)),
                  ],
                  rows: [
                    for (final c in list)
                      DataRow(cells: [
                        DataCell(Text(c.number)),
                        DataCell(Text(c.shareClassId)),
                        DataCell(Text(c.holderStockholderCode)),
                        DataCell(Text(_grouped(c.shares))),
                        DataCell(StatusPill.certificate(c.status, certificateStatusLabel(t, c.status))),
                      ]),
                  ],
                ),
              ),
      },
    );
  }

  static String _grouped(int n) {
    final s = n.toString();
    final out = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) out.write(',');
      out.write(s[i]);
    }
    return out.toString();
  }
}
