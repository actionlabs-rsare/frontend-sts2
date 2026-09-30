import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../i18n/strings.g.dart';
import '../../domain/entities/company.dart';
import '../../domain/usecases/create_company_use_case.dart';
import '../bloc/company_form_cubit.dart';
import '../bloc/company_form_state.dart';

/// Add-company modal. Company Code is auto-generated server-side.
class CompanyFormDialog extends StatelessWidget {
  const CompanyFormDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CompanyFormCubit(getIt<CreateCompanyUseCase>()),
      child: const _CompanyFormView(),
    );
  }
}

class _CompanyFormView extends StatefulWidget {
  const _CompanyFormView();

  @override
  State<_CompanyFormView> createState() => _CompanyFormViewState();
}

class _CompanyFormViewState extends State<_CompanyFormView> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _tin = TextEditingController();
  final _president = TextEditingController();
  final _corpSec = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _address.dispose();
    _tin.dispose();
    _president.dispose();
    _corpSec.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<CompanyFormCubit>().submit(CompanyDraft(
          name: _name.text.trim(),
          address: _address.text.trim(),
          tin: _tin.text.trim(),
          presidentName: _president.text.trim(),
          corporateSecretaryName: _corpSec.text.trim(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return BlocListener<CompanyFormCubit, CompanyFormState>(
      listener: (context, state) {
        if (state.status == CompanyFormStatus.success) {
          Navigator.of(context).pop(true);
        }
      },
      child: AlertDialog(
        title: Text(t.companies.formTitleAdd),
        content: SizedBox(
          width: 420,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _field(_name, t.companies.fieldName, required: true, maxLen: 200),
                  _field(_address, t.companies.fieldAddress, required: true, maxLen: 300),
                  _field(_tin, t.companies.fieldTin),
                  _field(_president, t.companies.fieldPresident),
                  _field(_corpSec, t.companies.fieldCorpSec),
                  BlocBuilder<CompanyFormCubit, CompanyFormState>(
                    builder: (context, state) {
                      if (state.errorMessage == null) return const SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(state.errorMessage!, style: const TextStyle(color: Colors.red)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(t.common.cancel),
          ),
          BlocBuilder<CompanyFormCubit, CompanyFormState>(
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

  Widget _field(TextEditingController c, String label, {bool required = false, int? maxLen}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: c,
        maxLength: maxLen,
        decoration: InputDecoration(labelText: label, counterText: ''),
        validator: (v) {
          if (required && (v == null || v.trim().isEmpty)) return 'Required';
          return null;
        },
      ),
    );
  }
}
