import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../features/auth/presentation/bloc/session_cubit.dart';
import '../../../i18n/strings.g.dart';
import '../../router/route_paths.dart';
import '../../theme/app_theme.dart';

/// AP-blue app shell: sidebar navigation + top bar with the dev role chip.
///
/// Responsive: the sidebar collapses to a drawer below the MOBILE breakpoint
/// (see [ResponsiveBreakpoints] in main.dart) so the shell keeps working on narrow viewports
/// instead of the previous fixed 260px-sidebar Row.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.title, required this.child, this.activeNav = 'Maintenance'});

  final String title;
  final Widget child;
  final String activeNav;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final sidebar = _Sidebar(active: activeNav);

    return Scaffold(
      drawer: isMobile ? Drawer(child: sidebar) : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!isMobile) SizedBox(width: 260, child: sidebar),
          Expanded(
            child: Column(
              children: [
                _TopBar(title: title, showMenuButton: isMobile),
                Expanded(child: Padding(padding: const EdgeInsets.all(24), child: child)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavEntry {
  const _NavEntry(this.label, this.icon, this.path);
  final String label;
  final IconData icon;
  final String path;
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({required this.active});

  final String active;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final navItems = <_NavEntry>[
      _NavEntry(t.nav.transactions, Icons.receipt_long, RoutePaths.transactions),
      _NavEntry(t.nav.maintenance, Icons.build, RoutePaths.maintenance),
      _NavEntry(t.nav.inquiry, Icons.search, RoutePaths.inquiry),
      _NavEntry(t.nav.reports, Icons.bar_chart, RoutePaths.reports),
      _NavEntry(t.nav.settings, Icons.settings, RoutePaths.settings),
    ];
    return Container(
      color: AppTokens.blue700,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration:
                      BoxDecoration(color: AppTokens.white, borderRadius: BorderRadius.circular(6)),
                  alignment: Alignment.center,
                  child: Text(t.common.appShortName,
                      style: const TextStyle(
                          color: AppTokens.blue700,
                          fontFamily: AppTokens.fontFamily,
                          fontWeight: FontWeight.w700)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(t.common.appTitle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: AppTokens.fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
                ),
              ],
            ),
          ),
          for (final entry in navItems)
            _NavItem(label: entry.label, icon: entry.icon, path: entry.path, active: entry.label == active),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.label, required this.icon, required this.path, required this.active});

  final String label;
  final IconData icon;
  final String path;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: active ? Colors.white.withValues(alpha: 0.14) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border:
            active ? const Border(left: BorderSide(color: AppTokens.skyBlue, width: 4)) : null,
      ),
      // Transparent Material so the ListTile's ink/tap paints without hiding the
      // DecoratedBox highlight (Flutter asserts otherwise once onTap is set).
      child: Material(
        type: MaterialType.transparency,
        child: ListTile(
          dense: true,
          onTap: () {
            if (Scaffold.maybeOf(context)?.hasDrawer ?? false) Navigator.of(context).maybePop();
            context.go(path);
          },
          leading: Icon(icon, color: active ? Colors.white : AppTokens.blue100, size: 20),
          title: Text(label,
              style: TextStyle(
                  color: active ? Colors.white : AppTokens.blue100,
                  fontFamily: AppTokens.fontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: 15)),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.title, required this.showMenuButton});

  final String title;
  final bool showMenuButton;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final role = context.select((SessionCubit c) => c.state.role) ?? '';
    return Container(
      height: 60,
      color: AppTokens.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (showMenuButton)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          Expanded(
            child: Text(title,
                style: const TextStyle(
                    fontFamily: AppTokens.fontFamily, fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          Chip(
            avatar: const CircleAvatar(
                backgroundColor: AppTokens.blue700,
                child: Icon(Icons.person, size: 16, color: Colors.white)),
            label: Text('$role ${t.auth.roleChipSuffix}'),
          ),
          IconButton(
            tooltip: t.common.signOut,
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<SessionCubit>().signOut(),
          ),
        ],
      ),
    );
  }
}
