# Быстрый старт с Strapi CMS

## Шаг 1: Установка зависимостей

```bash
flutter pub get
```

## Шаг 2: Генерация JSON моделей

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Шаг 3: Настройка Strapi

Следуйте инструкциям в файле `STRAPI_SETUP.md`

## Шаг 4: Запуск приложения

```bash
# Для разработки (localhost)
flutter run --dart-define=STRAPI_URL=http://localhost:1337

# Или отредактируйте lib/config/strapi_config.dart напрямую
```

## Важно

Если Strapi не запущен или недоступен, приложение автоматически использует дефолтные значения локализации.

## Проверка работы

1. Запустите Strapi: `npm run develop` (в папке с Strapi)
2. Создайте запись локализации в Strapi (см. STRAPI_SETUP.md)
3. Запустите Flutter приложение
4. Тексты должны загрузиться из Strapi

## Обновление контента

После изменения контента в Strapi:
- Очистите кеш в приложении (если нужно)
- Или используйте `AppLocalizations.refresh()` для принудительного обновления
