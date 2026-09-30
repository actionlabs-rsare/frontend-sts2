import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/widgets/modal_section_bar.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../i18n/strings.g.dart';
import '../../domain/entities/share_class.dart';
import '../../domain/usecases/save_share_class_use_case.dart';
import '../bloc/share_class_form_cubit.dart';
import '../bloc/share_class_form_state.dart';

/// Add / edit share class (MDM-003).
///
/// Total amount is shown live as authorized shares × par value and is read-only — the server is
/// authoritative, and this preview uses the same formula so the user sees the result before
/// saving without either side disagreeing on screen.
class ShareClassFormDialog extends StatelessWidget {
  const ShareClassFormDialog({super.key, required this.companyCode, this.existing});

  final String companyCode;
  final ShareClass? existing;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShareClassFormCubit(getIt<SaveShareClassUseCase>()),
      child: _ShareClassFormView(companyCode: companyCode, existing: existing),
    );
  }
}

class _ShareClassFormView extends StatefulWidget {
  const _ShareClassFormView({required this.companyCode, this.existing});

  final String companyCode;
  final ShareClass? existing;

  @override
  State<_ShareClassFormView> createState() => _ShareClassFormViewState();
}

class _ShareClassFormViewState extends State<_ShareClassFormView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _parValue;
  late final TextEditingController _authorized;
  late final TextEditingController _subscribed;
  late final TextEditingController _issued;
  late final TextEditingController _treasury;
  late String _stockType;

  static const _stockTypes = ['Common', 'Preferred', 'Redeemable Preferred'];

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final sc = widget.existing;
    _parValue = TextEditingController(text: sc?.parValue.toStringAsFixed(2) ?? '');
    _authorized = TextEditingController(text: sc?.authorizedShares.toString() ?? '');
    _subscribed = TextEditingController(text: sc?.subscribedShares.toString() ?? '0');
    _issued = TextEditingController(text: sc?.issuedShares.toString() ?? '0');
    _treasury = TextEditingController(text: sc?.treasuryShares.toString() ?? '0');
    _stockType = sc?.stockType ?? _stockTypes.first;
    for (final c in [_parValue, _authorized, _subscribed, _issued, _treasury]) {
      c.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _parValue.dispose();
    _authorized.dispose();
    _subscribed.dispose();
    _issued.dispose();
    _treasury.dispose();
    super.dispose();
  }

  double get _previewTotal {
    final par = double.tryParse(_parValue.text.trim()) ?? 0;
    final shares = int.tryParse(_authorized.text.trim()) ?? 0;
    return par * shares;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final draft = ShareClassDraft(
      stockType: _stockType,
      parValue: double.parse(_parValue.text.trim()),
      authorizedShares: int.parse(_authorized.text.trim()),
      subscribedShares: int.tryParse(_subscribed.text.trim()) ?? 0,
      issuedShares: int.tryParse(_issued.text.trim()) ?? 0,
      treasuryShares: int.tryParse(_treasury.text.trim()) ?? 0,
    );
    context
        .read<ShareClassFormCubit>()
        .submit(widget.companyCode, draft, existingId: widget.existing?.id);
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return BlocListener<ShareClassFormCubit, ShareClassFormState>(
      listener: (context, state) {
        if (state.status == ShareClassFormStatus.success) {
          Navigator.of(context).pop(state.saved);
        }
      },
      child: AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_isEdit ? t.shares.formTitleEdit : t.shares.formTitleAdd,
                style: const TextStyle(
                    fontFamily: AppTokens.fontFamily, fontSize: 20, fontWeight: FontWeight.w600)),
          ],
        ),
        content: SizedBox(
          width: 620,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ModalSectionBar(label: t.shares.sectionDetails),
                  _twoUp(
                    _readOnly(t.common.name, widget.companyCode),
                    DropdownButtonFormField<String>(
                      initialValue: _stockType,
                      isExpanded: true,
                      decoration: InputDecoration(labelText: t.shares.fieldStockType),
                      items: [
                        for (final s in _stockTypes) DropdownMenuItem(value: s, child: Text(s)),
                      ],
                      onChanged: (v) => setState(() => _stockType = v ?? _stockTypes.first),
                    ),
                  ),
                  _twoUp(
                    _number(_parValue, t.shares.fieldParValue, hint: '0.00', decimal: true),
                    _number(_authorized, t.shares.fieldAuthorized, hint: '0'),
                  ),
                  _twoUp(
                    _number(_subscribed, t.shares.fieldSubscribed, hint: '0'),
                    _number(_issued, t.shares.fieldIssued, hint: '0'),
                  ),
                  _twoUp(
                    _number(_treasury, t.shares.fieldTreasury, hint: '0'),
                    _readOnly(t.shares.fieldTotalAmount, formatPeso(_previewTotal)),
                  ),
                  const SizedBox(height: 8),
                  Text(t.shares.totalHint, style: const TextStyle(fontSize: 13, color: AppTokens.grey700)),
                  BlocBuilder<ShareClassFormCubit, ShareClassFormState>(
                    builder: (context, state) {
                      if (state.errorMessage == null) return const SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          children: [
                            const Icon(Icons.error_outline, size: 18, color: AppTokens.red400),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Text(state.errorMessage!,
                                    style: const TextStyle(color: AppTokens.red400))),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(t.common.cancel)),
          BlocBuilder<ShareClassFormCubit, ShareClassFormState>(
            builder: (context, state) {
              return FilledButton(
                onPressed: state.isSubmitting ? null : _submit,
                child: state.isSubmitting
                    ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
                    : Text(t.common.save),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _twoUp(Widget left, Widget right) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: left),
          const SizedBox(width: 16),
          Expanded(child: right),
        ],
      ),
    );
  }

  Widget _readOnly(String label, String value) {
    return TextFormField(
      key: ValueKey('readonly-$label-$value'),
      initialValue: value,
      readOnly: true,
      enabled: false,
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _number(TextEditingController controller, String label, {String? hint, bool decimal = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label, hintText: hint),
      validator: (v) {
        final value = v?.trim() ?? '';
        final required = label.endsWith('*');
        if (value.isEmpty) return required ? 'Required' : null;
        if (decimal) {
          final parsed = double.tryParse(value);
          if (parsed == null) return 'Enter an amount, for example 100.00';
          if (parsed < 0) return 'Cannot be negative';
        } else {
          final parsed = int.tryParse(value);
          if (parsed == null) return 'Enter a whole number of shares';
          if (parsed < 0) return 'Cannot be negative';
        }
        return null;
      },
    );
  }
}
