import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/widgets/modal_section_bar.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../../domain/entities/family_group.dart';
import '../../domain/entities/stockholder.dart';
import '../../domain/usecases/save_stockholder_use_case.dart';
import '../bloc/stockholder_form_cubit.dart';
import '../bloc/stockholder_form_state.dart';

/// Add / edit stockholder modal (MDM-002).
///
/// Stockholder Code is server-assigned from its own sequence, so it is read-only here.
/// Corporate details only appear when the type is Corporate, matching the server-side rule.
class StockholderFormDialog extends StatelessWidget {
  const StockholderFormDialog({super.key, required this.familyGroups, this.existing});

  final List<FamilyGroup> familyGroups;
  final Stockholder? existing;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StockholderFormCubit(getIt<SaveStockholderUseCase>()),
      child: _StockholderFormView(familyGroups: familyGroups, existing: existing),
    );
  }
}

class _StockholderFormView extends StatefulWidget {
  const _StockholderFormView({required this.familyGroups, this.existing});

  final List<FamilyGroup> familyGroups;
  final Stockholder? existing;

  @override
  State<_StockholderFormView> createState() => _StockholderFormViewState();
}

class _StockholderFormViewState extends State<_StockholderFormView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _tin;
  late final TextEditingController _nationality;
  late final TextEditingController _email;
  late final TextEditingController _mobile;
  late final TextEditingController _address;

  late String _type;
  late String _gender;
  String? _corporationType;
  String? _familyGroupId;

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final s = widget.existing;
    _name = TextEditingController(text: s?.name ?? '');
    _tin = TextEditingController(text: s?.tin ?? '');
    _nationality = TextEditingController(text: s?.nationality ?? 'Filipino');
    _email = TextEditingController(text: s?.email ?? '');
    _mobile = TextEditingController(text: s?.mobile ?? '');
    _address = TextEditingController(text: s?.address ?? '');
    _type = s?.type ?? 'Individual';
    _gender = s?.gender ?? 'PreferNotToSay';
    _corporationType = s?.corporationType;
    _familyGroupId = s?.familyGroupId;
  }

  @override
  void dispose() {
    _name.dispose();
    _tin.dispose();
    _nationality.dispose();
    _email.dispose();
    _address.dispose();
    _mobile.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final draft = StockholderDraft(
      name: _name.text.trim(),
      type: _type,
      tin: _tin.text.trim(),
      nationality: _nationality.text.trim(),
      gender: _gender,
      email: _email.text.trim(),
      mobile: _mobile.text.trim(),
      address: _address.text.trim(),
      corporationType: _type == 'Corporate' ? _corporationType : null,
      familyGroupId: _familyGroupId,
      active: widget.existing?.active,
    );
    context
        .read<StockholderFormCubit>()
        .submit(draft, existingCode: widget.existing?.stockholderCode);
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return BlocListener<StockholderFormCubit, StockholderFormState>(
      listener: (context, state) {
        if (state.status == StockholderFormStatus.success) {
          Navigator.of(context).pop(state.saved);
        }
      },
      child: AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_isEdit ? t.stockholders.formTitleEdit : t.stockholders.formTitleAdd,
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
                  ModalSectionBar(label: t.stockholders.sectionDetails),
                  _twoUp(
                    _readOnly(t.stockholders.fieldCode,
                        widget.existing?.stockholderCode ?? t.stockholders.fieldAutoAssigned),
                    _dropdown(
                      label: t.stockholders.fieldType,
                      value: _type,
                      items: {
                        'Individual': t.stockholders.typeIndividual,
                        'Corporate': t.stockholders.typeCorporate,
                      },
                      onChanged: (v) => setState(() => _type = v),
                    ),
                  ),
                  _text(_name, t.stockholders.fieldFullName, required: true, maxLen: 200),
                  _twoUp(
                    _text(_tin, t.stockholders.fieldTin, required: true, maxLen: 40, hint: '000-000-000-000'),
                    _text(_nationality, t.stockholders.fieldNationality, required: true, maxLen: 60),
                  ),
                  _twoUp(
                    _dropdown(
                      label: t.stockholders.fieldGender,
                      value: _gender,
                      items: {
                        'Female': t.stockholders.genderFemale,
                        'Male': t.stockholders.genderMale,
                        'PreferNotToSay': t.stockholders.genderPreferNotToSay,
                      },
                      onChanged: (v) => setState(() => _gender = v),
                    ),
                    _text(_email, t.stockholders.fieldEmail,
                        required: true, maxLen: 200, hint: 'name@example.com', email: true),
                  ),
                  _twoUp(
                    _text(_mobile, t.stockholders.fieldMobile, maxLen: 40, hint: '+63 9xx xxx xxxx'),
                    _familyGroupField(t),
                  ),
                  _text(_address, t.stockholders.fieldAddress, maxLen: 300),
                  if (_type == 'Corporate') ...[
                    ModalSectionBar(label: t.stockholders.sectionCorporate),
                    _twoUp(
                      _dropdown(
                        label: t.stockholders.fieldCorporationType,
                        value: _corporationType ?? 'Domestic',
                        items: {
                          'Domestic': t.stockholders.corpDomestic,
                          'Foreign': t.stockholders.corpForeign,
                        },
                        onChanged: (v) => setState(() => _corporationType = v),
                      ),
                      const SizedBox.shrink(),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Text(t.stockholders.piiNotice,
                      style: const TextStyle(fontSize: 13, color: AppTokens.grey700)),
                  BlocBuilder<StockholderFormCubit, StockholderFormState>(
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
          BlocBuilder<StockholderFormCubit, StockholderFormState>(
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

  Widget _familyGroupField(Translations t) {
    final items = <String, String>{for (final g in widget.familyGroups) g.id: g.name};
    return DropdownButtonFormField<String?>(
      initialValue: _familyGroupId,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: t.stockholders.fieldFamilyGroup,
        helperText: t.stockholders.fieldFamilyGroupHelper,
      ),
      items: [
        DropdownMenuItem<String?>(value: null, child: Text(t.common.none)),
        for (final e in items.entries) DropdownMenuItem<String?>(value: e.key, child: Text(e.value)),
      ],
      onChanged: (v) => setState(() => _familyGroupId = v),
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
      key: ValueKey('readonly-$label'),
      initialValue: value,
      readOnly: true,
      enabled: false,
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _text(
    TextEditingController controller,
    String label, {
    bool required = false,
    int? maxLen,
    String? hint,
    bool email = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        maxLength: maxLen,
        decoration: InputDecoration(labelText: label, hintText: hint, counterText: ''),
        validator: (v) {
          final value = v?.trim() ?? '';
          if (required && value.isEmpty) return 'Required';
          if (email && value.isNotEmpty && !value.contains('@')) {
            return 'Enter an email address, for example name@example.com';
          }
          return null;
        },
      ),
    );
  }

  Widget _dropdown({
    required String label,
    required String value,
    required Map<String, String> items,
    required ValueChanged<String> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(labelText: label),
      items: [
        for (final e in items.entries) DropdownMenuItem(value: e.key, child: Text(e.value)),
      ],
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
    );
  }
}
