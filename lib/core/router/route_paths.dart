/// Central table of route paths, so the sidebar, the router config and any programmatic
/// navigation agree on one set of strings.
abstract final class RoutePaths {
  const RoutePaths._();

  static const signIn = '/sign-in';
  static const transactions = '/transactions';
  static const transactionAdd = '/transactions/add';
  static const transactionDetail = '/transactions/:id';
  static const maintenance = '/maintenance';
  static const settings = '/settings';
  static const inquiry = '/inquiry';
  static const reports = '/reports';

  static String transactionDetailPath(String id) => '/transactions/$id';
}
