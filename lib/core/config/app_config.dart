/// Build-time configuration. Override with
/// `--dart-define=API_BASE_URL=http://host:8080/api` for other environments.
abstract final class AppConfig {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8080/api',
  );
}
