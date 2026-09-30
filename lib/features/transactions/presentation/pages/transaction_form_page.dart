import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/widgets/app_shell.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/usecases/create_transfer_use_case.dart';
import '../bloc/transaction_form_cubit.dart';
import '../bloc/transaction_form_state.dart';

/// Add-a-transfer form. Only the Transfer type is processed here (TR-003); subscriptions are
/// not. Stockholder/share-class fields are free text with synthetic defaults for now — they
/// become type-aheads backed by the stockholders/shares repositories in a later slice.
class TransactionFormPage extends StatelessWidget {
  const TransactionFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionFormCubit(getIt<CreateTransferUseCase>()),
      child: const _TransactionFormView(),
    );
  }
}

class _TransactionFormView extends StatefulWidget {
  const _TransactionFormView();

  @override
  State<_TransactionFormView> createState() => _TransactionFormViewState();
}

class _TransactionFormViewState extends State<_TransactionFormView> {
  final _formKey = GlobalKey<FormState>();
  final _company = TextEditingController(text: 'CO-001');
  final _date = TextEditingController(text: _todayIso());
  final _srf = TextEditingController(text: 'SRF-0001');
  final _remarks = TextEditingController();
  String _transferType = 'Sale';
  bool _exception = false;
  final List<_LineControllers> _lines = [_LineControllers()];

  static const _transferTypes = {
    'Sale': 'Sale',
    'Assignment': 'Assignment',
    'Donation': 'Donation',
    'ChangeOfNominee': 'Change of nominee',
  };

  static String _todayIso() {
    final now = DateTime.now();
    return '${now.year.toString().padLeft(4, '0')}-'
        '${now.month.toString().padLeft(2, '0')}-'
        '${now.day.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _company.dispose();
    _date.dispose();
    _srf.dispose();
    _remarks.dispose();
    for (final l in _lines) {
      l.dispose();
    }
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final draft = TransferDraft(
      companyCode: _company.text.trim(),
      transactionDate: _date.text.trim(),
      transferType: _transferType,
      srfNo: _srf.text.trim(),
      remarks: _remarks.text.trim(),
      exception: _exception,
      lines: [
        for (final l in _lines)
          TransferLineDraft(
            fromStockholderCode: l.from.text.trim(),
            toStockholderCode: l.to.text.trim(),
            shareClassId: l.shareClass.text.trim(),
            shares: int.tryParse(l.shares.text.trim()) ?? 0,
            sourceCertificateNumber: l.cert.text.trim(),
          ),
      ],
    );
    context.read<TransactionFormCubit>().submit(draft);
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return BlocListener<TransactionFormCubit, TransactionFormState>(
      listener: (context, state) {
        if (state.status == TransactionFormStatus.success) {
          Navigator.of(context).pop(true);
        }
      },
      child: AppShell(
        title: t.transactions.addTitle,
        activeNav: t.nav.transactions,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.transactions.addTitle,
                    style: const TextStyle(
                        fontFamily: AppTokens.fontFamily, fontSize: 24, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(t.transactions.addSubtitle, style: const TextStyle(color: AppTokens.grey700)),
                const SizedBox(height: 16),
                _card(t.transactions.sectionCommon, [
                  Row(children: [
                    Expanded(child: _text(_company, t.transactions.fieldCompany, required: true)),
                    const SizedBox(width: 16),
                    Expanded(
                        child: _text(_date, t.transactions.fieldDate, required: true, validator: _validDate)),
                  ]),
                  Row(children: [
                    Expanded(child: _text(_srf, t.transactions.fieldSrf)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: _transferType,
                        decoration: InputDecoration(labelText: t.transactions.fieldTransferType),
                        items: [
                          for (final e in _transferTypes.entries)
                            DropdownMenuItem(value: e.key, child: Text(e.value)),
                        ],
                        onChanged: (v) => setState(() => _transferType = v ?? 'Sale'),
                      ),
                    ),
                  ]),
                  _text(_remarks, t.transactions.fieldRemarks),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _exception,
                    onChanged: (v) => setState(() => _exception = v ?? false),
                    title: Text(t.transactions.exceptionCheckbox),
                  ),
                ]),
                _linesCard(t),
                BlocBuilder<TransactionFormCubit, TransactionFormState>(
                  builder: (context, state) {
                    if (state.errorMessage == null) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: _errorBanner(state.errorMessage!),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(t.common.cancel),
                    ),
                    const SizedBox(width: 12),
                    BlocBuilder<TransactionFormCubit, TransactionFormState>(
                      builder: (context, state) {
                        return FilledButton(
                          onPressed: state.isSubmitting ? null : _submit,
                          child: state.isSubmitting
                              ? const SizedBox(
                                  height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
                              : Text(t.transactions.submitTransaction),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(t.transactions.footNote,
                    style: const TextStyle(color: AppTokens.grey700, fontSize: 13)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _linesCard(Translations t) {
    return _card(t.transactions.sectionLines, [
      for (int i = 0; i < _lines.length; i++) _lineRow(i, t),
      const SizedBox(height: 8),
      Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
          onPressed: () => setState(() => _lines.add(_LineControllers())),
          icon: const Icon(Icons.add),
          label: Text(t.transactions.addLine),
        ),
      ),
    ]);
  }

  Widget _lineRow(int i, Translations t) {
    final l = _lines[i];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _text(l.from, t.transactions.fieldFrom, required: true)),
          const SizedBox(width: 8),
          Expanded(child: _text(l.to, t.transactions.fieldTo, required: true)),
          const SizedBox(width: 8),
          Expanded(child: _text(l.shareClass, t.transactions.fieldShareClass, required: true)),
          const SizedBox(width: 8),
          SizedBox(
              width: 110,
              child: _text(l.shares, t.transactions.fieldShares, required: true, validator: _validShares)),
          const SizedBox(width: 8),
          Expanded(child: _text(l.cert, t.transactions.fieldCertificate, required: true)),
          IconButton(
            tooltip: t.transactions.removeLine,
            onPressed: _lines.length == 1 ? null : () => setState(() => _lines.removeAt(i)),
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }

  Widget _card(String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.only(left: 10),
              decoration:
                  const BoxDecoration(border: Border(left: BorderSide(color: AppTokens.skyBlue, width: 4))),
              child: Text(title,
                  style: const TextStyle(fontFamily: AppTokens.fontFamily, fontWeight: FontWeight.w600)),
            ),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _text(TextEditingController c, String label,
      {bool required = false, String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: c,
        decoration: InputDecoration(labelText: label),
        validator: (v) {
          if (required && (v == null || v.trim().isEmpty)) return 'Required';
          if (validator != null) return validator(v);
          return null;
        },
      ),
    );
  }

  Widget _errorBanner(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTokens.red100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTokens.red400),
      ),
      child: Text(message, style: const TextStyle(color: Color(0xFF7A1A1D))),
    );
  }

  String? _validDate(String? v) {
    if (v == null || v.trim().isEmpty) return null;
    return RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(v.trim()) ? null : 'Use YYYY-MM-DD';
  }

  String? _validShares(String? v) {
    final n = int.tryParse((v ?? '').trim());
    if (n == null || n < 1) return 'Must be ≥ 1';
    return null;
  }
}

class _LineControllers {
  final from = TextEditingController(text: 'SH-0001');
  final to = TextEditingController(text: 'SH-0002');
  final shareClass = TextEditingController(text: 'SC-CO001-COMMON');
  final shares = TextEditingController();
  final cert = TextEditingController(text: '0142');

  void dispose() {
    from.dispose();
    to.dispose();
    shareClass.dispose();
    shares.dispose();
    cert.dispose();
  }
}
