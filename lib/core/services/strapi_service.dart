import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aircool/config/strapi_config.dart';
import 'package:aircool/core/models/strapi/localization_model.dart';

/// Сервис для работы с Strapi API
class StrapiService {
  static final StrapiService _instance = StrapiService._internal();
  factory StrapiService() => _instance;
  StrapiService._internal();

  // Кеш для локализации
  LocalizationAttributes? _cachedLocalization;
  DateTime? _cacheTimestamp;

  Map<String, String> _defaultHeaders() {
    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    if (StrapiConfig.token.isNotEmpty) {
      headers['Authorization'] = 'Bearer ${StrapiConfig.token}';
    }
    return headers;
  }

  /// Получить локализацию из Strapi
  /// 
  /// [locale] - язык локализации (по умолчанию 'ru')
  /// [forceRefresh] - принудительно обновить из API (игнорировать кеш)
  Future<LocalizationAttributes> getLocalization({
    String locale = 'ru',
    bool forceRefresh = false,
  }) async {
    // Проверяем кеш
    if (!forceRefresh &&
        StrapiConfig.enableCache &&
        _cachedLocalization != null &&
        _cacheTimestamp != null) {
      final cacheAge = DateTime.now().difference(_cacheTimestamp!);
      if (cacheAge < StrapiConfig.cacheDuration) {
        return _cachedLocalization!;
      }
    }

    try {
      final url = Uri.parse(
        '${StrapiConfig.apiUrl}/localizations?locale=$locale&pagination[limit]=1',
      );

      final response = await http
          .get(url, headers: _defaultHeaders())
          .timeout(StrapiConfig.timeout);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;

        // Обрабатываем ответ Strapi
        StrapiLocalizationResponse strapiResponse;
        if (jsonData.containsKey('data') && jsonData['data'] is List) {
          // Если пришел массив, берем первый элемент
          final dataList = jsonData['data'] as List;
          if (dataList.isNotEmpty) {
            final itemData = dataList[0] as Map<String, dynamic>;
            final attributesJson = itemData['attributes'] as Map<String, dynamic>;
            final attributes = _parseLocalizationAttributes(attributesJson);
            final item = StrapiLocalization(
              id: itemData['id'] as int,
              attributes: attributes,
            );
            strapiResponse = StrapiLocalizationResponse(
              data: item,
              meta: null, // Пока пропускаем мета
            );
          } else {
            throw Exception('No localization data found');
          }
        } else {
          // Если пришел один объект
          final itemData = jsonData['data'] as Map<String, dynamic>;
          final attributesJson = itemData['attributes'] as Map<String, dynamic>;
          final attributes = _parseLocalizationAttributes(attributesJson);
          final item = StrapiLocalization(
            id: itemData['id'] as int,
            attributes: attributes,
          );
          strapiResponse = StrapiLocalizationResponse(
            data: item,
            meta: null, // Пока пропускаем мета
          );
        }

        // Сохраняем в кеш
        _cachedLocalization = strapiResponse.data.attributes;
        _cacheTimestamp = DateTime.now();

        return _cachedLocalization!;
      } else {
        throw Exception(
          'Failed to load localization: ${response.statusCode}',
        );
      }
    } catch (e) {
      // Если не удалось загрузить из Strapi, возвращаем дефолтные значения
      print('Error loading from Strapi: $e');
      return getDefaultLocalization();
    }
  }

  /// Очистить кеш
  void clearCache() {
    _cachedLocalization = null;
    _cacheTimestamp = null;
  }

  /// Парсинг атрибутов локализации из JSON (временный метод до генерации кода)
  LocalizationAttributes _parseLocalizationAttributes(
    Map<String, dynamic> json,
  ) {
    return LocalizationAttributes(
      appTitle: json['appTitle'] as String? ?? '',
      companyName: json['companyName'] as String? ?? '',
      region: json['region'] as String? ?? '',
      footerText: json['footerText'] as String? ?? '',
      navHome: json['navHome'] as String? ?? '',
      navServices: json['navServices'] as String? ?? '',
      navProcess: json['navProcess'] as String? ?? '',
      navGallery: json['navGallery'] as String? ?? '',
      navContacts: json['navContacts'] as String? ?? '',
      heroBadge: json['heroBadge'] as String? ?? '',
      heroTitle: json['heroTitle'] as String? ?? '',
      heroDescription: json['heroDescription'] as String? ?? '',
      heroButtonCalculate: json['heroButtonCalculate'] as String? ?? '',
      heroButtonConsultation: json['heroButtonConsultation'] as String? ?? '',
      heroPriceFrom: json['heroPriceFrom'] as String? ?? '',
      heroPriceDescription: json['heroPriceDescription'] as String? ?? '',
      statYears: json['statYears'] as String? ?? '',
      statClients: json['statClients'] as String? ?? '',
      statSupport: json['statSupport'] as String? ?? '',
      aboutTitle: json['aboutTitle'] as String? ?? '',
      aboutSubtitle: json['aboutSubtitle'] as String? ?? '',
      aboutDescription: json['aboutDescription'] as String? ?? '',
      featureGuarantee: json['featureGuarantee'] as String? ?? '',
      featureMasters: json['featureMasters'] as String? ?? '',
      featureSchedule: json['featureSchedule'] as String? ?? '',
      featureQuality: json['featureQuality'] as String? ?? '',
      servicesTitle: json['servicesTitle'] as String? ?? '',
      servicesSubtitle: json['servicesSubtitle'] as String? ?? '',
      serviceInstallation: json['serviceInstallation'] as String? ?? '',
      serviceInstallationDesc:
          json['serviceInstallationDesc'] as String? ?? '',
      serviceMaintenance: json['serviceMaintenance'] as String? ?? '',
      serviceMaintenanceDesc: json['serviceMaintenanceDesc'] as String? ?? '',
      serviceRepair: json['serviceRepair'] as String? ?? '',
      serviceRepairDesc: json['serviceRepairDesc'] as String? ?? '',
      serviceRefill: json['serviceRefill'] as String? ?? '',
      serviceRefillDesc: json['serviceRefillDesc'] as String? ?? '',
      serviceDemount: json['serviceDemount'] as String? ?? '',
      serviceDemountDesc: json['serviceDemountDesc'] as String? ?? '',
      serviceConsultation: json['serviceConsultation'] as String? ?? '',
      serviceConsultationDesc: json['serviceConsultationDesc'] as String? ?? '',
      serviceInstallHeading: json['serviceInstallHeading'] as String? ?? '',
      serviceInstallText: json['serviceInstallText'] as String? ?? '',
      serviceDetailStandardTitle: json['serviceDetailStandardTitle'] as String? ?? '',
      serviceDetailStandardDescription:
          json['serviceDetailStandardDescription'] as String? ?? '',
      serviceDetailAdvancedTitle: json['serviceDetailAdvancedTitle'] as String? ?? '',
      serviceDetailAdvancedDescription:
          json['serviceDetailAdvancedDescription'] as String? ?? '',
      serviceDetailMultiTitle: json['serviceDetailMultiTitle'] as String? ?? '',
      serviceDetailMultiDescription:
          json['serviceDetailMultiDescription'] as String? ?? '',
      serviceDetailPremiumTitle: json['serviceDetailPremiumTitle'] as String? ?? '',
      serviceDetailPremiumDescription:
          json['serviceDetailPremiumDescription'] as String? ?? '',
      serviceDetailStandardPrice: json['serviceDetailStandardPrice'] as String? ?? '',
      serviceDetailAdvancedPrice: json['serviceDetailAdvancedPrice'] as String? ?? '',
      serviceDetailMultiPrice: json['serviceDetailMultiPrice'] as String? ?? '',
      serviceDetailPremiumPrice: json['serviceDetailPremiumPrice'] as String? ?? '',
      serviceDetailCleaningBasicPrice:
          json['serviceDetailCleaningBasicPrice'] as String? ?? '',
      serviceDetailCleaningDeepPrice:
          json['serviceDetailCleaningDeepPrice'] as String? ?? '',
      serviceDetailDiagnosticsPrice:
          json['serviceDetailDiagnosticsPrice'] as String? ?? '',
      serviceDetailCompressorPrice:
          json['serviceDetailCompressorPrice'] as String? ?? '',
      serviceDetailBoardPrice: json['serviceDetailBoardPrice'] as String? ?? '',
      serviceDetailFreonPrice: json['serviceDetailFreonPrice'] as String? ?? '',
      serviceMaintenanceSubtitleDetailed:
          json['serviceMaintenanceSubtitleDetailed'] as String? ?? '',
      serviceMaintenanceHeading: json['serviceMaintenanceHeading'] as String? ?? '',
      serviceMaintenanceText: json['serviceMaintenanceText'] as String? ?? '',
      serviceDetailCleaningBasicTitle:
          json['serviceDetailCleaningBasicTitle'] as String? ?? '',
      serviceDetailCleaningBasicDescription:
          json['serviceDetailCleaningBasicDescription'] as String? ?? '',
      serviceDetailCleaningDeepTitle:
          json['serviceDetailCleaningDeepTitle'] as String? ?? '',
      serviceDetailCleaningDeepDescription:
          json['serviceDetailCleaningDeepDescription'] as String? ?? '',
      serviceDetailDiagnosticsTitle:
          json['serviceDetailDiagnosticsTitle'] as String? ?? '',
      serviceDetailDiagnosticsDescription:
          json['serviceDetailDiagnosticsDescription'] as String? ?? '',
      serviceRepairSubtitleDetailed:
          json['serviceRepairSubtitleDetailed'] as String? ?? '',
      serviceDetailCompressorTitle:
          json['serviceDetailCompressorTitle'] as String? ?? '',
      serviceDetailCompressorDescription:
          json['serviceDetailCompressorDescription'] as String? ?? '',
      serviceDetailBoardTitle: json['serviceDetailBoardTitle'] as String? ?? '',
      serviceDetailBoardDescription:
          json['serviceDetailBoardDescription'] as String? ?? '',
      serviceDetailFreonTitle: json['serviceDetailFreonTitle'] as String? ?? '',
      serviceDetailFreonDescription:
          json['serviceDetailFreonDescription'] as String? ?? '',
      priceListTitle: json['priceListTitle'] as String? ?? '',
      priceListSubtitle: json['priceListSubtitle'] as String? ?? '',
      priceButton: json['priceButton'] as String? ?? '',
      priceInstallStandard: json['priceInstallStandard'] as String? ?? '',
      priceInstallEconomy: json['priceInstallEconomy'] as String? ?? '',
      priceInstallComfort: json['priceInstallComfort'] as String? ?? '',
      priceInstallMulti: json['priceInstallMulti'] as String? ?? '',
      priceDemount: json['priceDemount'] as String? ?? '',
      priceRefill: json['priceRefill'] as String? ?? '',
      priceCleaning: json['priceCleaning'] as String? ?? '',
      galleryTitle: json['galleryTitle'] as String? ?? '',
      gallerySubtitle: json['gallerySubtitle'] as String? ?? '',
      galleryAll: json['galleryAll'] as String? ?? '',
      galleryInstallation: json['galleryInstallation'] as String? ?? '',
      galleryMaintenance: json['galleryMaintenance'] as String? ?? '',
      galleryRepair: json['galleryRepair'] as String? ?? '',
      galleryStatsTitle: json['galleryStatsTitle'] as String? ?? '',
      galleryStatsSectionTitle:
          json['galleryStatsSectionTitle'] as String? ?? '',
      galleryStatInstallations:
          json['galleryStatInstallations'] as String? ?? '',
      galleryStatInstallationsSubtitle:
          json['galleryStatInstallationsSubtitle'] as String? ?? '',
      galleryStatServiced: json['galleryStatServiced'] as String? ?? '',
      galleryStatServicedSubtitle:
          json['galleryStatServicedSubtitle'] as String? ?? '',
      galleryStatSupport: json['galleryStatSupport'] as String? ?? '',
      galleryStatSupportSubtitle:
          json['galleryStatSupportSubtitle'] as String? ?? '',
      galleryStatExperience: json['galleryStatExperience'] as String? ?? '',
      galleryStatExperienceSubtitle:
          json['galleryStatExperienceSubtitle'] as String? ?? '',
      galleryDescription1: json['galleryDescription1'] as String? ?? '',
      galleryDescription2: json['galleryDescription2'] as String? ?? '',
      galleryDescription3: json['galleryDescription3'] as String? ?? '',
      galleryDescription4: json['galleryDescription4'] as String? ?? '',
      galleryDescription5: json['galleryDescription5'] as String? ?? '',
      galleryDescription6: json['galleryDescription6'] as String? ?? '',
      processTitle: json['processTitle'] as String? ?? '',
      processSubtitle: json['processSubtitle'] as String? ?? '',
      processStepsTitle: json['processStepsTitle'] as String? ?? '',
      processStep1Title: json['processStep1Title'] as String? ?? '',
      processStep1Desc: json['processStep1Desc'] as String? ?? '',
      processStep2Title: json['processStep2Title'] as String? ?? '',
      processStep2Desc: json['processStep2Desc'] as String? ?? '',
      processStep3Title: json['processStep3Title'] as String? ?? '',
      processStep3Desc: json['processStep3Desc'] as String? ?? '',
      processStep4Title: json['processStep4Title'] as String? ?? '',
      processStep4Desc: json['processStep4Desc'] as String? ?? '',
      processStep5Title: json['processStep5Title'] as String? ?? '',
      processStep5Desc: json['processStep5Desc'] as String? ?? '',
      processBenefitsTitle: json['processBenefitsTitle'] as String? ?? '',
      processBenefitsSubtitle: json['processBenefitsSubtitle'] as String? ?? '',
      processBenefit1Title: json['processBenefit1Title'] as String? ?? '',
      processBenefit1Description:
          json['processBenefit1Description'] as String? ?? '',
      processBenefit2Title: json['processBenefit2Title'] as String? ?? '',
      processBenefit2Description:
          json['processBenefit2Description'] as String? ?? '',
      processBenefit3Title: json['processBenefit3Title'] as String? ?? '',
      processBenefit3Description:
          json['processBenefit3Description'] as String? ?? '',
      processBenefit4Title: json['processBenefit4Title'] as String? ?? '',
      processBenefit4Description:
          json['processBenefit4Description'] as String? ?? '',
      processFAQTitle: json['processFAQTitle'] as String? ?? '',
      processFAQQuestion1: json['processFAQQuestion1'] as String? ?? '',
      processFAQAnswer1: json['processFAQAnswer1'] as String? ?? '',
      processFAQQuestion2: json['processFAQQuestion2'] as String? ?? '',
      processFAQAnswer2: json['processFAQAnswer2'] as String? ?? '',
      processFAQQuestion3: json['processFAQQuestion3'] as String? ?? '',
      processFAQAnswer3: json['processFAQAnswer3'] as String? ?? '',
      contactsTitle: json['contactsTitle'] as String? ?? '',
      contactsSubtitle: json['contactsSubtitle'] as String? ?? '',
      contactsMapTitle: json['contactsMapTitle'] as String? ?? '',
      contactsMapSubtitle: json['contactsMapSubtitle'] as String? ?? '',
      contactsFormTitle: json['contactsFormTitle'] as String? ?? '',
      contactsFormSubtitle: json['contactsFormSubtitle'] as String? ?? '',
      contactsFormName: json['contactsFormName'] as String? ?? '',
      contactsFormPhone: json['contactsFormPhone'] as String? ?? '',
      contactsFormEmail: json['contactsFormEmail'] as String? ?? '',
      contactsFormService: json['contactsFormService'] as String? ?? '',
      contactsFormMessage: json['contactsFormMessage'] as String? ?? '',
      contactsFormSubmit: json['contactsFormSubmit'] as String? ?? '',
      contactsFormSuccess: json['contactsFormSuccess'] as String? ?? '',
      contactsFormNameError: json['contactsFormNameError'] as String? ?? '',
      contactsFormPhoneError: json['contactsFormPhoneError'] as String? ?? '',
      contactsInfoTitle: json['contactsInfoTitle'] as String? ?? '',
      contactsAddressTitle: json['contactsAddressTitle'] as String? ?? '',
      contactsAddressValue: json['contactsAddressValue'] as String? ?? '',
      contactsPhoneTitle: json['contactsPhoneTitle'] as String? ?? '',
      contactsPhoneValue: json['contactsPhoneValue'] as String? ?? '',
      contactsEmailTitle: json['contactsEmailTitle'] as String? ?? '',
      contactsEmailValue: json['contactsEmailValue'] as String? ?? '',
      contactsScheduleTitle: json['contactsScheduleTitle'] as String? ?? '',
      contactsScheduleValue: json['contactsScheduleValue'] as String? ?? '',
      contactsSocialTitle: json['contactsSocialTitle'] as String? ?? '',
      contactsSocialTelegram: json['contactsSocialTelegram'] as String? ?? '',
      contactsSocialWhatsApp: json['contactsSocialWhatsApp'] as String? ?? '',
      contactsSocialVkontakte: json['contactsSocialVkontakte'] as String? ?? '',
      contactsMapPlaceholderTitle:
          json['contactsMapPlaceholderTitle'] as String? ?? '',
      contactsMapPlaceholderSubtitle:
          json['contactsMapPlaceholderSubtitle'] as String? ?? '',
      ctaTitle: json['ctaTitle'] as String? ?? '',
      ctaDescription: json['ctaDescription'] as String? ?? '',
      ctaButtonOrder: json['ctaButtonOrder'] as String? ?? '',
      ctaButtonAllServices: json['ctaButtonAllServices'] as String? ?? '',
      error404: json['error404'] as String? ?? '',
    );
  }

  /// Получить дефолтную локализацию (fallback)
  LocalizationAttributes getDefaultLocalization() {
      // Возвращаем дефолтные значения как fallback
      // В реальном приложении можно использовать пакет flutter_localizations
      return LocalizationAttributes(
      appTitle: 'Скиданов Сервис — Нижний Новгород',
      companyName: 'Скиданов Сервис',
      region: 'Нижний Новгород',
      footerText: '© 2024 Скиданов Сервис — Все права защищены',
      navHome: 'Главная',
      navServices: 'Услуги',
      navProcess: 'Процесс',
      navGallery: 'Галерея',
      navContacts: 'Контакты',
      heroBadge: 'Профессиональный монтаж кондиционеров',
      heroTitle: 'Климатические системы для вашего комфорта',
      heroDescription:
          'Более 15 лет устанавливаем и обслуживаем кондиционеры в Нижнем Новгороде. Гарантия качества, доступные цены и профессиональный подход.',
      heroButtonCalculate: 'Рассчитать стоимость',
      heroButtonConsultation: 'Бесплатная консультация',
      heroPriceFrom: 'Установка от 6 000 ₽',
      heroPriceDescription: 'Быстрый и аккуратный монтаж с гарантией 2 года',
      statYears: 'Лет опыта',
      statClients: 'Довольных клиентов',
      statSupport: 'Поддержка',
      aboutTitle: 'О компании',
      aboutSubtitle: 'Более 15 лет профессиональной работы в Нижнем Новгороде',
      aboutDescription:
          'Скиданов Сервис — это команда профессионалов с многолетним опытом работы в области климатической техники. Мы специализируемся на установке, обслуживании и ремонте кондиционеров любой сложности.',
      featureGuarantee: 'Гарантия 2 года',
      featureMasters: 'Опытные мастера',
      featureSchedule: 'Работаем 24/7',
      featureQuality: '100% качество',
      servicesTitle: 'Наши услуги',
      servicesSubtitle: 'Полный спектр услуг по кондиционированию',
      serviceInstallation: 'Установка кондиционеров',
      serviceInstallationDesc: 'Профессиональный монтаж сплит-систем любой мощности',
      serviceMaintenance: 'Обслуживание',
      serviceMaintenanceDesc:
          'Регулярная чистка и профилактика систем кондиционирования',
      serviceRepair: 'Ремонт',
      serviceRepairDesc: 'Быстрый и качественный ремонт любой сложности',
      serviceRefill: 'Заправка фреоном',
      serviceRefillDesc: 'Заправка и диагностика холодильного контура',
      serviceDemount: 'Демонтаж',
      serviceDemountDesc: 'Аккуратный демонтаж с сохранением всех элементов',
      serviceConsultation: 'Консультация',
      serviceConsultationDesc: 'Бесплатная консультация по выбору оборудования',
      serviceInstallHeading: 'Полный комплекс работ по монтажу',
      serviceInstallText:
          'Мы осуществляем профессиональный монтаж кондиционеров всех типов: настенные сплит-системы, кассетные, канальные, напольно-потолочные и мульти-сплит системы. Каждый монтаж включает полный комплекс работ с гарантией качества.',
      serviceDetailStandardTitle: 'Стандартный монтаж',
      serviceDetailStandardDescription:
          'Установка внутреннего и внешнего блоков, подключение коммуникаций',
      serviceDetailAdvancedTitle: 'Сложный монтаж',
      serviceDetailAdvancedDescription:
          'Дополнительные работы: штробление стен, протяжка трасс более 5 м',
      serviceDetailMultiTitle: 'Мульти-сплит системы',
      serviceDetailMultiDescription:
          'Установка систем с несколькими внутренними блоками',
      serviceDetailPremiumTitle: 'Премиум монтаж',
      serviceDetailPremiumDescription:
          'Полный комплекс работ с использованием премиальных материалов',
      serviceDetailStandardPrice: 'от 6 000 ₽',
      serviceDetailAdvancedPrice: 'от 10 000 ₽',
      serviceDetailMultiPrice: 'от 15 000 ₽',
      serviceDetailPremiumPrice: 'от 20 000 ₽',
      serviceDetailCleaningBasicPrice: 'от 1 500 ₽',
      serviceDetailCleaningDeepPrice: 'от 3 000 ₽',
      serviceDetailDiagnosticsPrice: 'от 1 000 ₽',
      serviceDetailCompressorPrice: 'от 8 000 ₽',
      serviceDetailBoardPrice: 'от 6 000 ₽',
      serviceDetailFreonPrice: 'от 2 500 ₽',
      serviceMaintenanceSubtitleDetailed:
          'Регулярное обслуживание для долговечной работы',
      serviceMaintenanceHeading: 'Комплексное сервисное обслуживание',
      serviceMaintenanceText:
          'Регулярная чистка и профилактика предотвращает поломки, снижает расход электроэнергии и повышает эффективность системы. Мы используем безопасные моющие средства и профессиональное оборудование.',
      serviceDetailCleaningBasicTitle: 'Базовая чистка',
      serviceDetailCleaningBasicDescription:
          'Очистка фильтров, дезинфекция испарителя',
      serviceDetailCleaningDeepTitle: 'Глубокая чистка',
      serviceDetailCleaningDeepDescription:
          'Разборка внутреннего блока, химическая чистка теплообменника',
      serviceDetailDiagnosticsTitle: 'Диагностика',
      serviceDetailDiagnosticsDescription:
          'Проверка давления хладагента, электроники и дренажа',
      serviceRepairSubtitleDetailed: 'Быстрое и качественное устранение неисправностей',
      serviceDetailCompressorTitle: 'Замена компрессора',
      serviceDetailCompressorDescription:
          'Подбор и замена компрессора, проверка герметичности',
      serviceDetailBoardTitle: 'Ремонт платы управления',
      serviceDetailBoardDescription: 'Диагностика и ремонт электроники, прошивка',
      serviceDetailFreonTitle: 'Заправка фреоном',
      serviceDetailFreonDescription:
          'Поиск утечек, вакуумирование, дозаправка',
      priceListTitle: 'Прайс-лист',
      priceListSubtitle: 'Прозрачные цены без скрытых платежей',
      priceButton: 'Получить подробный расчет',
      priceInstallStandard: 'Установка сплит-системы (стандарт)',
      priceInstallEconomy: 'Установка кондиционера до 3.5 кВт (эконом)',
      priceInstallComfort: 'Установка кондиционера до 5.0 кВт (комфорт)',
      priceInstallMulti: 'Установка мульти-сплит (за блок)',
      priceDemount: 'Демонтаж старого кондиционера',
      priceRefill: 'Пуско-наладка и заправка фреоном (1 контур)',
      priceCleaning: 'Чистка и сервис (сплит-система)',
      galleryTitle: 'Примеры работ',
      gallerySubtitle: 'Реализованные проекты в Нижнем Новгороде',
      galleryAll: 'Все работы',
      galleryInstallation: 'Установка',
      galleryMaintenance: 'Обслуживание',
      galleryRepair: 'Ремонт',
      galleryStatsTitle: 'Наша статистика',
      galleryStatsSectionTitle: 'Наша статистика',
      galleryStatInstallations: '2000+',
      galleryStatInstallationsSubtitle: 'Установленных систем',
      galleryStatServiced: '500+',
      galleryStatServicedSubtitle: 'Обслуживаемых объектов',
      galleryStatSupport: '24/7',
      galleryStatSupportSubtitle: 'Служба поддержки',
      galleryStatExperience: '15+',
      galleryStatExperienceSubtitle: 'Лет на рынке',
      galleryDescription1: 'Установка сплит-системы в квартире',
      galleryDescription2: 'Монтаж кондиционера в офисе',
      galleryDescription3: 'Обслуживание торгового центра',
      galleryDescription4: 'Ремонт промышленного кондиционера',
      galleryDescription5: 'Монтаж мульти-сплит системы',
      galleryDescription6: 'Профилактика системы кондиционирования',
      processTitle: 'Процесс работы',
      processSubtitle: 'Четкий алгоритм действий от заявки до сдачи объекта',
      processStepsTitle: 'Этапы сотрудничества',
      processStep1Title: 'Заявка',
      processStep1Desc: 'Оставьте заявку на сайте или по телефону',
      processStep2Title: 'Выезд мастера',
      processStep2Desc: 'Бесплатный выезд на объект для оценки работ',
      processStep3Title: 'Расчет стоимости',
      processStep3Desc: 'Прозрачный расчет без скрытых платежей',
      processStep4Title: 'Монтаж',
      processStep4Desc: 'Профессиональный монтаж с гарантией качества',
      processStep5Title: 'Сдача объекта',
      processStep5Desc: 'Проверка работы и инструктаж по эксплуатации',
      processBenefitsTitle: 'Преимущества сотрудничества',
      processBenefitsSubtitle: 'Мы сопровождаем проект на каждом этапе',
      processBenefit1Title: 'Гарантия на работы',
      processBenefit1Description: 'Гарантия 24 месяца на монтаж и сервисные работы. Работаем по договору.',
      processBenefit2Title: 'Прозрачная смета',
      processBenefit2Description:
          'Подробный расчет без скрытых платежей. Стоимость фиксируется до начала работ.',
      processBenefit3Title: 'Собственные бригады',
      processBenefit3Description:
          'Опытные специалисты с профильным образованием и допусками.',
      processBenefit4Title: 'Качественные материалы',
      processBenefit4Description:
          'Используем проверенные бренды оборудования и комплектующих.',
      processFAQTitle: 'Частые вопросы',
      processFAQQuestion1: 'Сколько занимает монтаж кондиционера?',
      processFAQAnswer1:
          'Стандартный монтаж сплит-системы занимает 3–4 часа. Сложные проекты с трассами могут потребовать до 1 рабочего дня.',
      processFAQQuestion2: 'Когда проводить обслуживание кондиционера?',
      processFAQAnswer2:
          'Рекомендуем проводить сервисное обслуживание два раза в год: перед летним сезоном и после его окончания.',
      processFAQQuestion3: 'Какая гарантия предоставляется?',
      processFAQAnswer3:
          'На монтажные работы — 24 месяца. На оборудование распространяется заводская гарантия производителя.',
      contactsTitle: 'Контакты',
      contactsSubtitle: 'Свяжитесь с нами для консультации или оформления заказа',
      contactsMapTitle: 'Мы на карте',
      contactsMapSubtitle: 'Наш офис в Нижнем Новгороде',
      contactsFormTitle: 'Оставить заявку',
      contactsFormSubtitle: 'Заполните форму и мы свяжемся с вами в течение 15 минут',
      contactsFormName: 'Ваше имя',
      contactsFormPhone: 'Телефон',
      contactsFormEmail: 'Email (необязательно)',
      contactsFormService: 'Услуга',
      contactsFormMessage: 'Сообщение (необязательно)',
      contactsFormSubmit: 'Отправить заявку',
      contactsFormSuccess:
          'Заявка отправлена! Мы свяжемся с вами в ближайшее время.',
      contactsFormNameError: 'Пожалуйста, введите ваше имя',
      contactsFormPhoneError: 'Пожалуйста, введите ваш телефон',
      contactsInfoTitle: 'Контактная информация',
      contactsAddressTitle: 'Адрес',
      contactsAddressValue: 'Нижний Новгород, ул. Ленина, 12',
      contactsPhoneTitle: 'Телефон',
      contactsPhoneValue: '+7 (831) 123-45-67',
      contactsEmailTitle: 'Email',
      contactsEmailValue: 'info@skidanov-service.ru',
      contactsScheduleTitle: 'График работы',
      contactsScheduleValue: 'Пн-Пт: 9:00 – 20:00\nСб: 10:00 – 18:00\nВс: по записи',
      contactsSocialTitle: 'Мы в социальных сетях',
      contactsSocialTelegram: 'Telegram',
      contactsSocialWhatsApp: 'WhatsApp',
      contactsSocialVkontakte: 'ВКонтакте',
      contactsMapPlaceholderTitle: 'Интерактивная карта появится на этом месте',
      contactsMapPlaceholderSubtitle: 'Подключите виджет Яндекс.Карт или Google Maps',
      ctaTitle: 'Готовы начать проект?',
      ctaDescription:
          'Оставьте заявку и получите бесплатную консультацию нашего специалиста',
      ctaButtonOrder: 'Заказать замер',
      ctaButtonAllServices: 'Все услуги',
      error404: 'Страница не найдена',
    );
  }
}
