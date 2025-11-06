# Настройка Strapi CMS для проекта Aircool

## 1. Установка Strapi

```bash
# Создайте новый проект Strapi
npx create-strapi-app@latest aircool-strapi

# Или используйте существующий проект
cd aircool-strapi
npm run develop
```

## 2. Создание Content Type "Localization"

В админ-панели Strapi (http://localhost:1337/admin):

1. Перейдите в **Content-Type Builder**
2. Нажмите **Create new collection type**
3. Назовите его `Localization`
4. Добавьте следующие поля:

### Основная информация
- `appTitle` - Text (Short text)
- `companyName` - Text (Short text)
- `region` - Text (Short text)
- `footerText` - Text (Long text)

### Навигация
- `navHome` - Text (Short text)
- `navServices` - Text (Short text)
- `navProcess` - Text (Short text)
- `navGallery` - Text (Short text)
- `navContacts` - Text (Short text)

### Hero секция
- `heroBadge` - Text (Short text)
- `heroTitle` - Text (Long text)
- `heroDescription` - Text (Long text)
- `heroButtonCalculate` - Text (Short text)
- `heroButtonConsultation` - Text (Short text)
- `heroPriceFrom` - Text (Short text)
- `heroPriceDescription` - Text (Short text)

### Статистика
- `statYears` - Text (Short text)
- `statClients` - Text (Short text)
- `statSupport` - Text (Short text)

### О компании
- `aboutTitle` - Text (Short text)
- `aboutSubtitle` - Text (Short text)
- `aboutDescription` - Text (Long text)
- `featureGuarantee` - Text (Short text)
- `featureMasters` - Text (Short text)
- `featureSchedule` - Text (Short text)
- `featureQuality` - Text (Short text)

### Услуги
- `servicesTitle` - Text (Short text)
- `servicesSubtitle` - Text (Short text)
- `serviceInstallation` - Text (Short text)
- `serviceInstallationDesc` - Text (Long text)
- `serviceMaintenance` - Text (Short text)
- `serviceMaintenanceDesc` - Text (Long text)
- `serviceRepair` - Text (Short text)
- `serviceRepairDesc` - Text (Long text)
- `serviceRefill` - Text (Short text)
- `serviceRefillDesc` - Text (Long text)
- `serviceDemount` - Text (Short text)
- `serviceDemountDesc` - Text (Long text)
- `serviceConsultation` - Text (Short text)
- `serviceConsultationDesc` - Text (Long text)

### Прайс-лист
- `priceListTitle` - Text (Short text)
- `priceListSubtitle` - Text (Short text)
- `priceButton` - Text (Short text)
- `priceInstallStandard` - Text (Short text)
- `priceInstallEconomy` - Text (Short text)
- `priceInstallComfort` - Text (Short text)
- `priceInstallMulti` - Text (Short text)
- `priceDemount` - Text (Short text)
- `priceRefill` - Text (Short text)
- `priceCleaning` - Text (Short text)

### Галерея
- `galleryTitle` - Text (Short text)
- `gallerySubtitle` - Text (Short text)
- `galleryAll` - Text (Short text)
- `galleryInstallation` - Text (Short text)
- `galleryMaintenance` - Text (Short text)
- `galleryRepair` - Text (Short text)
- `galleryStatsTitle` - Text (Short text)

### Процесс
- `processTitle` - Text (Short text)
- `processSubtitle` - Text (Short text)
- `processStepsTitle` - Text (Short text)
- `processStep1Title` - Text (Short text)
- `processStep1Desc` - Text (Short text)
- `processStep2Title` - Text (Short text)
- `processStep2Desc` - Text (Short text)
- `processStep3Title` - Text (Short text)
- `processStep3Desc` - Text (Short text)
- `processStep4Title` - Text (Short text)
- `processStep4Desc` - Text (Short text)
- `processStep5Title` - Text (Short text)
- `processStep5Desc` - Text (Short text)

### Контакты
- `contactsTitle` - Text (Short text)
- `contactsSubtitle` - Text (Short text)
- `contactsMapTitle` - Text (Short text)
- `contactsMapSubtitle` - Text (Short text)
- `contactsFormTitle` - Text (Short text)
- `contactsFormSubtitle` - Text (Short text)
- `contactsFormName` - Text (Short text)
- `contactsFormPhone` - Text (Short text)
- `contactsFormEmail` - Text (Short text)
- `contactsFormService` - Text (Short text)
- `contactsFormMessage` - Text (Short text)
- `contactsFormSubmit` - Text (Short text)
- `contactsFormSuccess` - Text (Short text)
- `contactsFormNameError` - Text (Short text)
- `contactsFormPhoneError` - Text (Short text)

### CTA
- `ctaTitle` - Text (Short text)
- `ctaDescription` - Text (Short text)
- `ctaButtonOrder` - Text (Short text)
- `ctaButtonAllServices` - Text (Short text)

### Ошибки
- `error404` - Text (Short text)

## 3. Настройка Permissions

1. Перейдите в **Settings → Users & Permissions plugin → Roles → Public**
2. Найдите `Localization` в списке
3. Включите `find` и `findOne`
4. Сохраните

## 4. Создание записи локализации

1. Перейдите в **Content Manager → Localization**
2. Нажмите **Create new entry**
3. Заполните все поля нужными значениями
4. Нажмите **Save** и затем **Publish**

## 5. Настройка Internationalization (опционально)

Если нужно поддержать несколько языков:

1. Перейдите в **Settings → Internationalization**
2. Включите плагин
3. Добавьте нужные языки (например, ru, en)
4. При создании записи локализации выберите язык

## 6. Настройка CORS (если нужно)

Если Flutter приложение работает на другом домене:

1. Перейдите в **Settings → Users & Permissions plugin → Advanced Settings**
2. Включите CORS
3. Добавьте домен вашего Flutter приложения

## 7. Конфигурация в Flutter приложении

Отредактируйте `lib/config/strapi_config.dart`:

```dart
static const String baseUrl = 'http://localhost:1337'; // Для разработки
// или
static const String baseUrl = 'https://your-strapi-domain.com'; // Для продакшена
```

Или установите через переменную окружения:

```bash
flutter run --dart-define=STRAPI_URL=http://localhost:1337
```

## 8. Генерация JSON моделей

После создания моделей в Strapi, запустите генерацию:

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## 9. Тестирование

1. Убедитесь, что Strapi запущен
2. Запустите Flutter приложение
3. Проверьте, что тексты загружаются из Strapi
4. Измените текст в Strapi и проверьте обновление (с учетом кеша)

## Полезные команды

```bash
# Запуск Strapi в режиме разработки
npm run develop

# Запуск Strapi в продакшене
npm run start

# Сборка Strapi
npm run build
```

## Troubleshooting

### Ошибка подключения к Strapi
- Проверьте, что Strapi запущен
- Проверьте URL в `strapi_config.dart`
- Проверьте CORS настройки

### Тексты не обновляются
- Очистите кеш: `StrapiService().clearCache()`
- Используйте `forceRefresh: true` при загрузке

### Ошибки JSON парсинга
- Убедитесь, что все поля заполнены в Strapi
- Проверьте структуру данных в ответе API
