import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/inline_message_box.dart';
import '../../../../core/presentation/widgets/section_card.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../domain/entities/certificate.dart';
import '../bloc/print_cubit.dart';

/// TR-017 / TR-018 print dialog. Pops with the printed certificates.
class PrintDialog extends StatefulWidget {
  const PrintDialog({super.key, required this.transaction, this.subtitle});

  final PrintableTransactionRef transaction;
  final String? subtitle;

  @override
  State<PrintDialog> createState() => _PrintDialogState();
}

class _PrintDialogState extends State<PrintDialog> {
  PrintMode _mode = PrintMode.systemTemplate;
  bool _useManual = false;
  bool _teamLeaderApproval = false;
  final _manual = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _busy = false;
  String? _error;

  bool get _isRun => widget.transaction.certificateCount > 1;

  @override
  void dispose() {
    _manual.dispose();
    super.dispose();
  }

  Future<void> _print() async {
    if (!_formKey.currentState!.validate()) return;
    final cubit = context.read<PrintCubit>();
    if (_useManual) {
      final ok = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Use a manual certificate number?'),
          content: Text('Certificate ${_manual.text.trim()} will be recorded as a manual number approved by you '
              'as Team Leader, and the approval goes into the audit trail. It must be the next number in the '
              'sequence, because numbers run without gaps; otherwise the print is refused.'
              '${_isRun ? ' The other ${widget.transaction.certificateCount - 1} certificate(s) follow on from it.' : ''}'),
          actions: [
            OutlinedButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Cancel')),
            FilledButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('Approve and print')),
          ],
        ),
      );
      if (ok != true) return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    final printed = await cubit.print(
          widget.transaction,
          _mode,
          manualNumber: _useManual ? _manual.text.trim() : null,
          teamLeaderApproval: _useManual && _teamLeaderApproval,
        );
    if (!mounted) return;
    if (printed != null) {
      Navigator.of(context).pop(printed);
    } else {
      setState(() {
        _busy = false;
        _error = 'Could not print. Check your connection and try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.certificates.printDialogTitle(id: widget.transaction.id)),
          if (widget.subtitle != null)
            Text(widget.subtitle!,
                style: const TextStyle(fontSize: 14, color: AppTokens.grey700, fontWeight: FontWeight.w400)),
        ],
      ),
      content: SizedBox(
        width: 520,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YellowSectionBar(t.certificates.sectionPrintOption),
                RadioGroup<PrintMode>(
                  groupValue: _mode,
                  onChanged: (v) => setState(() => _mode = v ?? _mode),
                  child: const Column(
                    children: [
                      RadioListTile<PrintMode>(
                        key: Key('mode-PrePrintedForm'),
                        value: PrintMode.prePrintedForm,
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Pre-printed form'),
                        subtitle: Text("Fills only the values onto AP's pre-printed certificate stock."),
                      ),
                      RadioListTile<PrintMode>(
                        key: Key('mode-SystemTemplate'),
                        value: PrintMode.systemTemplate,
                        contentPadding: EdgeInsets.all(0),
                        title: Text('System-generated template'),
                        subtitle: Text(
                            'Prints the full certificate, with the President and Corporate Secretary filled in.'),
                      ),
                    ],
                  ),
                ),
                YellowSectionBar(t.certificates.sectionCertificateNumber),
                Text(t.certificates.autoNumberHint, style: const TextStyle(color: AppTokens.grey700)),
                CheckboxListTile(
                  key: const Key('useManual'),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _useManual,
                  onChanged: (v) => setState(() => _useManual = v ?? false),
                  title: Text(t.certificates.useManualNumber),
                  subtitle: _isRun
                      ? Text('This print produces ${widget.transaction.certificateCount} certificates: the manual '
                          'number is the first one, and the others follow on in sequence.')
                      : null,
                ),
                if (_useManual) ...[
                  TextFormField(
                    key: const Key('manualNumber'),
                    controller: _manual,
                    decoration: InputDecoration(
                      labelText: t.certificates.manualNumberField,
                      helperText: t.certificates.manualNumberHelper,
                      helperMaxLines: 2,
                    ),
                    validator: (v) =>
                        RegExp(r'^\d{1,10}$').hasMatch(v?.trim() ?? '') ? null : 'Use digits only, e.g. 500.',
                  ),
                  CheckboxListTile(
                    key: const Key('teamLeaderApproval'),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _teamLeaderApproval,
                    onChanged: (v) => setState(() => _teamLeaderApproval = v ?? false),
                    title: Text(t.certificates.teamLeaderApprovalCheckbox),
                    subtitle: Text(t.certificates.teamLeaderApprovalHelper),
                  ),
                ],
                if (_error != null) ...[
                  const SizedBox(height: 12),
                  ErrorBox(_error!),
                ],
              ],
            ),
          ),
        ),
      ),
      actions: [
        OutlinedButton(onPressed: _busy ? null : () => Navigator.of(context).pop(), child: Text(t.common.cancel)),
        FilledButton.icon(
          key: const Key('printButton'),
          onPressed: _busy ? null : _print,
          icon: _busy
              ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.print_outlined),
          label: Text(_busy ? t.certificates.printing : t.certificates.print),
        ),
      ],
    );
  }
}
