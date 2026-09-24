enum Environment { development, staging, production }

class AppConfig {
  static late Environment _environment;
  static late String _baseUrl;

  static void setup(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.development:
        _baseUrl = 'https://dev.api.example.com';
        break;
      case Environment.staging:
        _baseUrl = 'https://stg.api.example.com';
        break;
      case Environment.production:
        _baseUrl = 'https://api.example.com';
        break;
    }
  }

  static Environment get environment => _environment;
  static String get baseUrl => _baseUrl;
}