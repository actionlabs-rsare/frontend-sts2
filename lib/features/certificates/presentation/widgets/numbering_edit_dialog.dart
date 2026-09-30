import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/inline_message_box.dart';
import '../../../../core/presentation/widgets/section_card.dart';
import '../../../../i18n/strings.g.dart';
import '../../domain/entities/certificate.dart';
import '../bloc/numbering_cubit.dart';

/// Edit starting points + mode for one share class. Numbers are gapless (S3-Q7), so a starting
/// point can be set only until its series issues the first certificate; after that the field is
/// read-only and says why. Confirms before setting a start.
class NumberingEditDialog extends StatefulWidget {
  const NumberingEditDialog({super.key, required this.shareClass, required this.current});

  final ShareClassRef shareClass;
  final NumberingConfig current;

  @override
  State<NumberingEditDialog> createState() => _NumberingEditDialogState();
}

class _NumberingEditDialogState extends State<NumberingEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late final _original = TextEditingController(text: widget.current.nextOriginal);
  late final _replacement = TextEditingController(text: widget.current.nextReplacement);
  late NumberingMode _mode = widget.current.mode;
  bool _busy = false;
  String? _error;

  static final _digits = RegExp(r'^\d{1,10}$');
  static final _replacementPattern = RegExp(r'^(?:[Rr]-?)?\d{1,10}$');

  @override
  void dispose() {
    _original.dispose();
    _replacement.dispose();
    super.dispose();
  }

  bool _changed(TextEditingController c, String next) => c.text.trim() != next;

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final cubit = context.read<NumberingCubit>();
    final originalChanged = _changed(_original, widget.current.nextOriginal);
    final replacementChanged = _changed(_replacement, widget.current.nextReplacement);
    final modeChanged = _mode != widget.current.mode;
    if (!originalChanged && !replacementChanged && !modeChanged) {
      Navigator.of(context).pop();
      return;
    }
    if (originalChanged || replacementChanged) {
      final ok = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Set the starting point?'),
          content: Text('${widget.shareClass.stockType} will start at '
              '${originalChanged ? _original.text.trim() : widget.current.nextOriginal} (original) and '
              '${replacementChanged ? _replacement.text.trim() : widget.current.nextReplacement} (replacement). '
              'Once the first certificate is issued, the starting point is locked so numbers stay gapless.'),
          actions: [
            OutlinedButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Cancel')),
            FilledButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('Set starting point')),
          ],
        ),
      );
      if (ok != true) return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    final saved = await cubit.save(
          widget.shareClass,
          originalStart: originalChanged ? _original.text.trim() : null,
          replacementStart: replacementChanged ? _replacement.text.trim() : null,
          mode: modeChanged ? _mode : null,
        );
    if (!mounted) return;
    if (saved != null) {
      Navigator.of(context).pop(saved);
    } else {
      setState(() {
        _busy = false;
        _error = 'Could not save the numbering. Check your connection and try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return AlertDialog(
      title: Text(t.certificates.editDialogTitle(stockType: widget.shareClass.stockType)),
      content: SizedBox(
        width: 460,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YellowSectionBar(t.certificates.sectionStartingPoints),
                TextFormField(
                  key: const Key('originalStart'),
                  controller: _original,
                  enabled: !widget.current.originalLocked,
                  decoration: InputDecoration(
                    labelText: t.certificates.fieldOriginalStart,
                    helperText: widget.current.originalLocked
                        ? 'Locked: certificates have been issued. Numbers continue from '
                            '${widget.current.nextOriginal} without gaps.'
                        : 'Digits, e.g. 235. Can be set until the first certificate is issued.',
                    helperMaxLines: 2,
                  ),
                  validator: (v) => _digits.hasMatch(v?.trim() ?? '') ? null : 'Use digits only, e.g. 235.',
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('replacementStart'),
                  controller: _replacement,
                  enabled: !widget.current.replacementLocked,
                  decoration: InputDecoration(
                    labelText: t.certificates.fieldReplacementStart,
                    helperText: widget.current.replacementLocked
                        ? 'Locked: replacements have been issued. Numbers continue from '
                            '${widget.current.nextReplacement} without gaps.'
                        : 'e.g. R-7. Can be set until the first replacement is issued.',
                    helperMaxLines: 2,
                  ),
                  validator: (v) =>
                      _replacementPattern.hasMatch(v?.trim() ?? '') ? null : 'Use R- and digits, e.g. R-7.',
                ),
                YellowSectionBar(t.certificates.sectionNumberingMode),
                DropdownButtonFormField<NumberingMode>(
                  initialValue: _mode,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: t.certificates.modeLabel,
                    helperText: t.certificates.modeHelper,
                    helperMaxLines: 2,
                  ),
                  items: [
                    for (final m in NumberingMode.values) DropdownMenuItem(value: m, child: Text(m.wire)),
                  ],
                  onChanged: (v) => setState(() => _mode = v ?? _mode),
                ),
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
        FilledButton(
          onPressed: _busy ? null : _save,
          child: _busy
              ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
              : Text(t.certificates.saveConfiguration),
        ),
      ],
    );
  }
}
