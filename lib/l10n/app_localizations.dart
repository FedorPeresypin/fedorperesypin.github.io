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
  static String get serviceInstallHeading => current.serviceInstallHeading;
  static String get serviceInstallText => current.serviceInstallText;
  static String get serviceDetailStandardTitle => current.serviceDetailStandardTitle;
  static String get serviceDetailStandardDescription => current.serviceDetailStandardDescription;
  static String get serviceDetailAdvancedTitle => current.serviceDetailAdvancedTitle;
  static String get serviceDetailAdvancedDescription => current.serviceDetailAdvancedDescription;
  static String get serviceDetailMultiTitle => current.serviceDetailMultiTitle;
  static String get serviceDetailMultiDescription => current.serviceDetailMultiDescription;
  static String get serviceDetailPremiumTitle => current.serviceDetailPremiumTitle;
  static String get serviceDetailPremiumDescription => current.serviceDetailPremiumDescription;
  static String get serviceDetailStandardPrice => current.serviceDetailStandardPrice;
  static String get serviceDetailAdvancedPrice => current.serviceDetailAdvancedPrice;
  static String get serviceDetailMultiPrice => current.serviceDetailMultiPrice;
  static String get serviceDetailPremiumPrice => current.serviceDetailPremiumPrice;
  static String get serviceDetailCleaningBasicPrice => current.serviceDetailCleaningBasicPrice;
  static String get serviceDetailCleaningDeepPrice => current.serviceDetailCleaningDeepPrice;
  static String get serviceDetailDiagnosticsPrice => current.serviceDetailDiagnosticsPrice;
  static String get serviceDetailCompressorPrice => current.serviceDetailCompressorPrice;
  static String get serviceDetailBoardPrice => current.serviceDetailBoardPrice;
  static String get serviceDetailFreonPrice => current.serviceDetailFreonPrice;
  static String get serviceMaintenanceSubtitleDetailed => current.serviceMaintenanceSubtitleDetailed;
  static String get serviceMaintenanceHeading => current.serviceMaintenanceHeading;
  static String get serviceMaintenanceText => current.serviceMaintenanceText;
  static String get serviceDetailCleaningBasicTitle => current.serviceDetailCleaningBasicTitle;
  static String get serviceDetailCleaningBasicDescription => current.serviceDetailCleaningBasicDescription;
  static String get serviceDetailCleaningDeepTitle => current.serviceDetailCleaningDeepTitle;
  static String get serviceDetailCleaningDeepDescription => current.serviceDetailCleaningDeepDescription;
  static String get serviceDetailDiagnosticsTitle => current.serviceDetailDiagnosticsTitle;
  static String get serviceDetailDiagnosticsDescription => current.serviceDetailDiagnosticsDescription;
  static String get serviceRepairSubtitleDetailed => current.serviceRepairSubtitleDetailed;
  static String get serviceDetailCompressorTitle => current.serviceDetailCompressorTitle;
  static String get serviceDetailCompressorDescription => current.serviceDetailCompressorDescription;
  static String get serviceDetailBoardTitle => current.serviceDetailBoardTitle;
  static String get serviceDetailBoardDescription => current.serviceDetailBoardDescription;
  static String get serviceDetailFreonTitle => current.serviceDetailFreonTitle;
  static String get serviceDetailFreonDescription => current.serviceDetailFreonDescription;

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
  static String get galleryStatsSectionTitle => current.galleryStatsSectionTitle;
  static String get galleryStatInstallations => current.galleryStatInstallations;
  static String get galleryStatInstallationsSubtitle => current.galleryStatInstallationsSubtitle;
  static String get galleryStatServiced => current.galleryStatServiced;
  static String get galleryStatServicedSubtitle => current.galleryStatServicedSubtitle;
  static String get galleryStatSupport => current.galleryStatSupport;
  static String get galleryStatSupportSubtitle => current.galleryStatSupportSubtitle;
  static String get galleryStatExperience => current.galleryStatExperience;
  static String get galleryStatExperienceSubtitle => current.galleryStatExperienceSubtitle;
  static List<String> get galleryDescriptions => [
        current.galleryDescription1,
        current.galleryDescription2,
        current.galleryDescription3,
        current.galleryDescription4,
        current.galleryDescription5,
        current.galleryDescription6,
      ];

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
  static String get processBenefitsTitle => current.processBenefitsTitle;
  static String get processBenefitsSubtitle => current.processBenefitsSubtitle;
  static String get processBenefit1Title => current.processBenefit1Title;
  static String get processBenefit1Description => current.processBenefit1Description;
  static String get processBenefit2Title => current.processBenefit2Title;
  static String get processBenefit2Description => current.processBenefit2Description;
  static String get processBenefit3Title => current.processBenefit3Title;
  static String get processBenefit3Description => current.processBenefit3Description;
  static String get processBenefit4Title => current.processBenefit4Title;
  static String get processBenefit4Description => current.processBenefit4Description;
  static String get processFAQTitle => current.processFAQTitle;
  static String get processFAQQuestion1 => current.processFAQQuestion1;
  static String get processFAQAnswer1 => current.processFAQAnswer1;
  static String get processFAQQuestion2 => current.processFAQQuestion2;
  static String get processFAQAnswer2 => current.processFAQAnswer2;
  static String get processFAQQuestion3 => current.processFAQQuestion3;
  static String get processFAQAnswer3 => current.processFAQAnswer3;

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
  static String get contactsInfoTitle => current.contactsInfoTitle;
  static String get contactsAddressTitle => current.contactsAddressTitle;
  static String get contactsAddressValue => current.contactsAddressValue;
  static String get contactsPhoneTitle => current.contactsPhoneTitle;
  static String get contactsPhoneValue => current.contactsPhoneValue;
  static String get contactsEmailTitle => current.contactsEmailTitle;
  static String get contactsEmailValue => current.contactsEmailValue;
  static String get contactsScheduleTitle => current.contactsScheduleTitle;
  static String get contactsScheduleValue => current.contactsScheduleValue;
  static String get contactsSocialTitle => current.contactsSocialTitle;
  static String get contactsSocialTelegram => current.contactsSocialTelegram;
  static String get contactsSocialWhatsApp => current.contactsSocialWhatsApp;
  static String get contactsSocialVkontakte => current.contactsSocialVkontakte;
  static String get contactsMapPlaceholderTitle => current.contactsMapPlaceholderTitle;
  static String get contactsMapPlaceholderSubtitle => current.contactsMapPlaceholderSubtitle;

  // CTA
  static String get ctaTitle => current.ctaTitle;
  static String get ctaDescription => current.ctaDescription;
  static String get ctaButtonOrder => current.ctaButtonOrder;
  static String get ctaButtonAllServices => current.ctaButtonAllServices;

  // Ошибки
  static String get error404 => current.error404;
}