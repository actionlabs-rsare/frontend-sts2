import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/presentation/widgets/async_error_view.dart';
import '../../../../i18n/strings.g.dart';
import '../../domain/usecases/get_companies_use_case.dart';
import '../bloc/company_list_cubit.dart';
import '../bloc/company_list_state.dart';
import '../widgets/company_form_dialog.dart';

/// MDM-001 Company Maintenance — list + create.
class CompanyListPage extends StatelessWidget {
  const CompanyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CompanyListCubit(getIt<GetCompaniesUseCase>()),
      child: const _CompanyListView(),
    );
  }
}

class _CompanyListView extends StatelessWidget {
  const _CompanyListView();

  Future<void> _openAddDialog(BuildContext context) async {
    final cubit = context.read<CompanyListCubit>();
    final created = await showDialog<bool>(
      context: context,
      builder: (_) => const CompanyFormDialog(),
    );
    if (created == true) cubit.load();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(t.companies.heading,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 24)),
            ),
            FilledButton.icon(
              onPressed: () => _openAddDialog(context),
              icon: const Icon(Icons.add),
              label: Text(t.companies.addCompany),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Card(
            child: BlocBuilder<CompanyListCubit, CompanyListState>(
              builder: (context, state) {
                switch (state.status) {
                  case CompanyListStatus.initial:
                  case CompanyListStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                  case CompanyListStatus.failure:
                    return AsyncErrorView(
                      message: t.companies.loadError,
                      onRetry: () => context.read<CompanyListCubit>().load(),
                    );
                  case CompanyListStatus.success:
                    final companies = state.companies;
                    if (companies.isEmpty) {
                      return Center(child: Text(t.companies.empty));
                    }
                    return SingleChildScrollView(
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text(t.companies.columnCode)),
                          DataColumn(label: Text(t.companies.columnName)),
                          DataColumn(label: Text(t.companies.columnAddress)),
                          DataColumn(label: Text(t.companies.columnPresident)),
                        ],
                        rows: [
                          for (final c in companies)
                            DataRow(cells: [
                              DataCell(Text(c.companyCode)),
                              DataCell(Text(c.name)),
                              DataCell(Text(c.address)),
                              DataCell(Text(c.presidentName ?? t.common.notAvailable)),
                            ]),
                        ],
                      ),
                    );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
