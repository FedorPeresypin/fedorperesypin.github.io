import 'package:aircool/core/services/strapi_service.dart';
import 'package:aircool/core/models/strapi/localization_model.dart';

/// Локализация приложения
/// Загружает тексты из Strapi CMS или использует дефолтные значения
class AppLocalizations {
  static LocalizationAttributes? _localization;
  static bool _isLoading = false;

  /// Инициализация локализации (загрузка из Strapi)
  static Future<void> initialize() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final strapiService = StrapiService();
      _localization = await strapiService.getLocalization();
    } catch (e) {
      print('Error initializing localization: $e');
      // Используем дефолтные значения
      final strapiService = StrapiService();
      _localization = await strapiService.getLocalization(forceRefresh: false);
    } finally {
      _isLoading = false;
    }
  }

  /// Обновить локализацию из Strapi
  static Future<void> refresh() async {
    final strapiService = StrapiService();
    _localization = await strapiService.getLocalization(forceRefresh: true);
  }

  /// Получить текущую локализацию
  static LocalizationAttributes get current {
    if (_localization == null) {
      // Если локализация еще не загружена, возвращаем дефолтные значения
      final strapiService = StrapiService();
      return strapiService.getDefaultLocalization();
    }
    return _localization!;
  }

  // Основная информация
  static String get appTitle => current.appTitle;
  static String get companyName => current.companyName;
  static String get region => current.region;
  static String get footerText => current.footerText;

  // Навигация
  static String get navHome => current.navHome;
  static String get navServices => current.navServices;
  static String get navProcess => current.navProcess;
  static String get navGallery => current.navGallery;
  static String get navContacts => current.navContacts;

  // Hero секция
  static String get heroBadge => current.heroBadge;
  static String get heroTitle => current.heroTitle;
  static String get heroDescription => current.heroDescription;
  static String get heroButtonCalculate => current.heroButtonCalculate;
  static String get heroButtonConsultation => current.heroButtonConsultation;
  static String get heroPriceFrom => current.heroPriceFrom;
  static String get heroPriceDescription => current.heroPriceDescription;

  // Статистика
  static String get statYears => current.statYears;
  static String get statClients => current.statClients;
  static String get statSupport => current.statSupport;

  // О компании
  static String get aboutTitle => current.aboutTitle;
  static String get aboutSubtitle => current.aboutSubtitle;
  static String get aboutDescription => current.aboutDescription;
  static String get featureGuarantee => current.featureGuarantee;
  static String get featureMasters => current.featureMasters;
  static String get featureSchedule => current.featureSchedule;
  static String get featureQuality => current.featureQuality;

  // Услуги
  static String get servicesTitle => current.servicesTitle;
  static String get servicesSubtitle => current.servicesSubtitle;
  static String get serviceInstallation => current.serviceInstallation;
  static String get serviceInstallationDesc => current.serviceInstallationDesc;
  static String get serviceMaintenance => current.serviceMaintenance;
  static String get serviceMaintenanceDesc => current.serviceMaintenanceDesc;
  static String get serviceRepair => current.serviceRepair;
  static String get serviceRepairDesc => current.serviceRepairDesc;
  static String get serviceRefill => current.serviceRefill;
  static String get serviceRefillDesc => current.serviceRefillDesc;
  static String get serviceDemount => current.serviceDemount;
  static String get serviceDemountDesc => current.serviceDemountDesc;
  static String get serviceConsultation => current.serviceConsultation;
  static String get serviceConsultationDesc => current.serviceConsultationDesc;

  // Прайс-лист
  static String get priceListTitle => current.priceListTitle;
  static String get priceListSubtitle => current.priceListSubtitle;
  static String get priceButton => current.priceButton;
  static String get priceInstallStandard => current.priceInstallStandard;
  static String get priceInstallEconomy => current.priceInstallEconomy;
  static String get priceInstallComfort => current.priceInstallComfort;
  static String get priceInstallMulti => current.priceInstallMulti;
  static String get priceDemount => current.priceDemount;
  static String get priceRefill => current.priceRefill;
  static String get priceCleaning => current.priceCleaning;

  // Галерея
  static String get galleryTitle => current.galleryTitle;
  static String get gallerySubtitle => current.gallerySubtitle;
  static String get galleryAll => current.galleryAll;
  static String get galleryInstallation => current.galleryInstallation;
  static String get galleryMaintenance => current.galleryMaintenance;
  static String get galleryRepair => current.galleryRepair;
  static String get galleryStatsTitle => current.galleryStatsTitle;

  // Процесс
  static String get processTitle => current.processTitle;
  static String get processSubtitle => current.processSubtitle;
  static String get processStepsTitle => current.processStepsTitle;
  static String get processStep1Title => current.processStep1Title;
  static String get processStep1Desc => current.processStep1Desc;
  static String get processStep2Title => current.processStep2Title;
  static String get processStep2Desc => current.processStep2Desc;
  static String get processStep3Title => current.processStep3Title;
  static String get processStep3Desc => current.processStep3Desc;
  static String get processStep4Title => current.processStep4Title;
  static String get processStep4Desc => current.processStep4Desc;
  static String get processStep5Title => current.processStep5Title;
  static String get processStep5Desc => current.processStep5Desc;

  // Контакты
  static String get contactsTitle => current.contactsTitle;
  static String get contactsSubtitle => current.contactsSubtitle;
  static String get contactsMapTitle => current.contactsMapTitle;
  static String get contactsMapSubtitle => current.contactsMapSubtitle;
  static String get contactsFormTitle => current.contactsFormTitle;
  static String get contactsFormSubtitle => current.contactsFormSubtitle;
  static String get contactsFormName => current.contactsFormName;
  static String get contactsFormPhone => current.contactsFormPhone;
  static String get contactsFormEmail => current.contactsFormEmail;
  static String get contactsFormService => current.contactsFormService;
  static String get contactsFormMessage => current.contactsFormMessage;
  static String get contactsFormSubmit => current.contactsFormSubmit;
  static String get contactsFormSuccess => current.contactsFormSuccess;
  static String get contactsFormNameError => current.contactsFormNameError;
  static String get contactsFormPhoneError => current.contactsFormPhoneError;

  // CTA
  static String get ctaTitle => current.ctaTitle;
  static String get ctaDescription => current.ctaDescription;
  static String get ctaButtonOrder => current.ctaButtonOrder;
  static String get ctaButtonAllServices => current.ctaButtonAllServices;

  // Ошибки
  static String get error404 => current.error404;
}