import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/app_shell.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import 'numbering_page.dart';
import 'print_page.dart';

/// The two certificate screens under the shared app shell: numbering (SL-002) and printing
/// (TR-017/018), wired into Settings.
class CertificatesPage extends StatelessWidget {
  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return DefaultTabController(
      length: 2,
      child: AppShell(
        title: t.nav.settings,
        activeNav: t.nav.settings,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelColor: AppTokens.blue700,
                unselectedLabelColor: AppTokens.grey700,
                indicatorColor: AppTokens.blue700,
                tabs: [
                  Tab(icon: const Icon(Icons.pin_outlined), text: t.certificates.numberingTitle),
                  Tab(icon: const Icon(Icons.print_outlined), text: t.certificates.printTitle),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: TabBarView(
                children: [
                  NumberingPage(),
                  PrintPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
