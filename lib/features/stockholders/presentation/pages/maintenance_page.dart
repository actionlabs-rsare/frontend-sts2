import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/app_shell.dart';
import '../../../../core/presentation/widgets/master_data_tabs.dart';
import '../../../../i18n/strings.g.dart';
import '../../../companies/presentation/pages/company_list_page.dart';
import '../../../shares/presentation/pages/share_class_page.dart';
import 'family_group_page.dart';
import 'stockholder_list_page.dart';

/// Maintenance section — the tabbed host bringing companies, stockholders, company shares and
/// family groups together under one nav item (CR-6 integration point).
class MaintenancePage extends StatefulWidget {
  const MaintenancePage({super.key, this.initialTab = 0});

  final int initialTab;

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  late int _tab = widget.initialTab;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final labels = [
      t.companies.title,
      t.stockholders.pageTitle,
      t.shares.pageTitle,
      t.familyGroups.pageTitle,
    ];
    return AppShell(
      title: t.nav.maintenance,
      activeNav: t.nav.maintenance,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MasterDataTabs(
            labels: labels,
            activeIndex: _tab,
            onSelect: (i) => setState(() => _tab = i),
          ),
          const SizedBox(height: 16),
          Expanded(child: _body()),
        ],
      ),
    );
  }

  Widget _body() {
    return switch (_tab) {
      1 => const StockholderListPage(),
      2 => const ShareClassPage(),
      3 => const FamilyGroupPage(),
      _ => const CompanyListPage(),
    };
  }
}
