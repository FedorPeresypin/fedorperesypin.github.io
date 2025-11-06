/// Конфигурация Strapi CMS
class StrapiConfig {
  // URL вашего Strapi сервера
  // Для разработки: http://localhost:1337
  // Для продакшена: https://your-domain.com
  static const String baseUrl = String.fromEnvironment(
    'STRAPI_URL',
    defaultValue: 'http://localhost:1337',
  );

  // API Token (можно переопределить через --dart-define=STRAPI_TOKEN=...)
  static const String token = String.fromEnvironment(
    'STRAPI_TOKEN',
    defaultValue:
        '628030048190b6d509260dc9d0dc56e1a7e465c86690efc7d722cdbd6a457409ad9b6302a21ef395b77a0f3c3fbf1434ebef30036d3d78d27790dd2a22ad013a72ee93ad4bb31bfad24384ff086bda5ee2544a53c524fe86025281b6dc34307da2f114be0d0efbe2957ba51a560b675f956c1327a37634741ee766bdfe0c0393',
  );

  // API endpoint
  static const String apiPath = '/api';

  // Полный URL API
  static String get apiUrl => '$baseUrl$apiPath';

  // Таймаут для запросов (в секундах)
  static const Duration timeout = Duration(seconds: 30);

  // Включить кеширование
  static const bool enableCache = true;

  // Время жизни кеша (в секундах)
  static const Duration cacheDuration = Duration(minutes: 5);
}
