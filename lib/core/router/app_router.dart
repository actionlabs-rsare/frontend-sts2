import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/session_cubit.dart';
import '../../features/auth/presentation/bloc/session_state.dart';
import '../../features/auth/presentation/pages/dev_sign_in_page.dart';
import '../../features/certificates/presentation/pages/certificates_page.dart';
import '../../features/stockholders/presentation/pages/maintenance_page.dart';
import '../../features/transactions/presentation/pages/transaction_detail_page.dart';
import '../../features/transactions/presentation/pages/transaction_form_page.dart';
import '../../features/transactions/presentation/pages/transactions_list_page.dart';
import '../di/injection.dart';
import '../presentation/widgets/app_shell.dart';
import '../theme/app_theme.dart';
import 'route_paths.dart';

/// Builds the app's go_router config. Redirects to sign-in when there is no session, and back
/// to the transactions list once signed in (so /sign-in never lingers in history).
GoRouter buildAppRouter() {
  final sessionCubit = getIt<SessionCubit>();
  return GoRouter(
    initialLocation: RoutePaths.transactions,
    refreshListenable: _SessionListenable(sessionCubit),
    redirect: (context, state) {
      final isSignedIn = sessionCubit.state.isSignedIn;
      final onSignIn = state.matchedLocation == RoutePaths.signIn;
      if (!isSignedIn && !onSignIn) return RoutePaths.signIn;
      if (isSignedIn && onSignIn) return RoutePaths.transactions;
      return null;
    },
    routes: [
      GoRoute(path: RoutePaths.signIn, builder: (context, state) => const DevSignInPage()),
      GoRoute(
        path: RoutePaths.transactions,
        builder: (context, state) => const TransactionsListPage(),
      ),
      GoRoute(
        path: RoutePaths.transactionAdd,
        builder: (context, state) => const TransactionFormPage(),
      ),
      GoRoute(
        path: RoutePaths.transactionDetail,
        builder: (context, state) =>
            TransactionDetailPage(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: RoutePaths.maintenance,
        builder: (context, state) => const MaintenancePage(),
      ),
      GoRoute(
        path: RoutePaths.settings,
        builder: (context, state) => const CertificatesPage(),
      ),
      GoRoute(
        path: RoutePaths.inquiry,
        builder: (context, state) => const _PlaceholderPage(
            nav: 'Inquiry', message: 'Stock certificate history inquiry arrives in a later slice.'),
      ),
      GoRoute(
        path: RoutePaths.reports,
        builder: (context, state) => const _PlaceholderPage(
            nav: 'Reports', message: 'Transaction reports export from the transaction detail view.'),
      ),
    ],
  );
}

/// Bridges a [SessionCubit] (a Bloc [Cubit]) to go_router's [Listenable]-based refresh hook,
/// so the router re-evaluates its redirect whenever the session changes.
class _SessionListenable extends ChangeNotifier {
  _SessionListenable(SessionCubit cubit) {
    _subscription = cubit.stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<SessionState> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.nav, required this.message});

  final String nav;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: nav,
      activeNav: nav,
      child: Center(
        child: Text(message, style: const TextStyle(fontSize: 16, color: AppTokens.grey700)),
      ),
    );
  }
}
