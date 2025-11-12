import 'package:json_annotation/json_annotation.dart';
import 'package:aircool/core/models/strapi/strapi_content_item.dart';
import 'package:aircool/core/models/strapi/strapi_response.dart';

// part 'localization_model.g.dart'; // Раскомментируйте после генерации кода

/// Модель локализации из Strapi
@JsonSerializable()
class LocalizationAttributes {
  final String appTitle;
  final String companyName;
  final String region;
  final String footerText;

  // Навигация
  final String navHome;
  final String navServices;
  final String navProcess;
  final String navGallery;
  final String navContacts;

  // Hero секция
  final String heroBadge;
  final String heroTitle;
  final String heroDescription;
  final String heroButtonCalculate;
  final String heroButtonConsultation;
  final String heroPriceFrom;
  final String heroPriceDescription;

  // Статистика
  final String statYears;
  final String statClients;
  final String statSupport;

  // О компании
  final String aboutTitle;
  final String aboutSubtitle;
  final String aboutDescription;
  final String featureGuarantee;
  final String featureMasters;
  final String featureSchedule;
  final String featureQuality;

  // Услуги
  final String servicesTitle;
  final String servicesSubtitle;
  final String serviceInstallation;
  final String serviceInstallationDesc;
  final String serviceMaintenance;
  final String serviceMaintenanceDesc;
  final String serviceRepair;
  final String serviceRepairDesc;
  final String serviceRefill;
  final String serviceRefillDesc;
  final String serviceDemount;
  final String serviceDemountDesc;
  final String serviceConsultation;
  final String serviceConsultationDesc;
  final String serviceInstallHeading;
  final String serviceInstallText;
  final String serviceDetailStandardTitle;
  final String serviceDetailStandardDescription;
  final String serviceDetailAdvancedTitle;
  final String serviceDetailAdvancedDescription;
  final String serviceDetailMultiTitle;
  final String serviceDetailMultiDescription;
  final String serviceDetailPremiumTitle;
  final String serviceDetailPremiumDescription;
  final String serviceDetailStandardPrice;
  final String serviceDetailAdvancedPrice;
  final String serviceDetailMultiPrice;
  final String serviceDetailPremiumPrice;
  final String serviceDetailCleaningBasicPrice;
  final String serviceDetailCleaningDeepPrice;
  final String serviceDetailDiagnosticsPrice;
  final String serviceDetailCompressorPrice;
  final String serviceDetailBoardPrice;
  final String serviceDetailFreonPrice;
  final String serviceMaintenanceSubtitleDetailed;
  final String serviceMaintenanceHeading;
  final String serviceMaintenanceText;
  final String serviceDetailCleaningBasicTitle;
  final String serviceDetailCleaningBasicDescription;
  final String serviceDetailCleaningDeepTitle;
  final String serviceDetailCleaningDeepDescription;
  final String serviceDetailDiagnosticsTitle;
  final String serviceDetailDiagnosticsDescription;
  final String serviceRepairSubtitleDetailed;
  final String serviceDetailCompressorTitle;
  final String serviceDetailCompressorDescription;
  final String serviceDetailBoardTitle;
  final String serviceDetailBoardDescription;
  final String serviceDetailFreonTitle;
  final String serviceDetailFreonDescription;

  // Прайс-лист
  final String priceListTitle;
  final String priceListSubtitle;
  final String priceButton;
  final String priceInstallStandard;
  final String priceInstallEconomy;
  final String priceInstallComfort;
  final String priceInstallMulti;
  final String priceDemount;
  final String priceRefill;
  final String priceCleaning;

  // Галерея
  final String galleryTitle;
  final String gallerySubtitle;
  final String galleryAll;
  final String galleryInstallation;
  final String galleryMaintenance;
  final String galleryRepair;
  final String galleryStatsTitle;
  final String galleryStatsSectionTitle;
  final String galleryStatInstallations;
  final String galleryStatInstallationsSubtitle;
  final String galleryStatServiced;
  final String galleryStatServicedSubtitle;
  final String galleryStatSupport;
  final String galleryStatSupportSubtitle;
  final String galleryStatExperience;
  final String galleryStatExperienceSubtitle;
  final String galleryDescription1;
  final String galleryDescription2;
  final String galleryDescription3;
  final String galleryDescription4;
  final String galleryDescription5;
  final String galleryDescription6;

  // Процесс
  final String processTitle;
  final String processSubtitle;
  final String processStepsTitle;
  final String processStep1Title;
  final String processStep1Desc;
  final String processStep2Title;
  final String processStep2Desc;
  final String processStep3Title;
  final String processStep3Desc;
  final String processStep4Title;
  final String processStep4Desc;
  final String processStep5Title;
  final String processStep5Desc;
  final String processBenefitsTitle;
  final String processBenefitsSubtitle;
  final String processBenefit1Title;
  final String processBenefit1Description;
  final String processBenefit2Title;
  final String processBenefit2Description;
  final String processBenefit3Title;
  final String processBenefit3Description;
  final String processBenefit4Title;
  final String processBenefit4Description;
  final String processFAQTitle;
  final String processFAQQuestion1;
  final String processFAQAnswer1;
  final String processFAQQuestion2;
  final String processFAQAnswer2;
  final String processFAQQuestion3;
  final String processFAQAnswer3;

  // Контакты
  final String contactsTitle;
  final String contactsSubtitle;
  final String contactsMapTitle;
  final String contactsMapSubtitle;
  final String contactsFormTitle;
  final String contactsFormSubtitle;
  final String contactsFormName;
  final String contactsFormPhone;
  final String contactsFormEmail;
  final String contactsFormService;
  final String contactsFormMessage;
  final String contactsFormSubmit;
  final String contactsFormSuccess;
  final String contactsFormNameError;
  final String contactsFormPhoneError;
  final String contactsInfoTitle;
  final String contactsAddressTitle;
  final String contactsAddressValue;
  final String contactsPhoneTitle;
  final String contactsPhoneValue;
  final String contactsEmailTitle;
  final String contactsEmailValue;
  final String contactsScheduleTitle;
  final String contactsScheduleValue;
  final String contactsSocialTitle;
  final String contactsSocialTelegram;
  final String contactsSocialWhatsApp;
  final String contactsSocialVkontakte;
  final String contactsMapPlaceholderTitle;
  final String contactsMapPlaceholderSubtitle;

  // CTA
  final String ctaTitle;
  final String ctaDescription;
  final String ctaButtonOrder;
  final String ctaButtonAllServices;

  // Ошибки
  final String error404;

  LocalizationAttributes({
    required this.appTitle,
    required this.companyName,
    required this.region,
    required this.footerText,
    required this.navHome,
    required this.navServices,
    required this.navProcess,
    required this.navGallery,
    required this.navContacts,
    required this.heroBadge,
    required this.heroTitle,
    required this.heroDescription,
    required this.heroButtonCalculate,
    required this.heroButtonConsultation,
    required this.heroPriceFrom,
    required this.heroPriceDescription,
    required this.statYears,
    required this.statClients,
    required this.statSupport,
    required this.aboutTitle,
    required this.aboutSubtitle,
    required this.aboutDescription,
    required this.featureGuarantee,
    required this.featureMasters,
    required this.featureSchedule,
    required this.featureQuality,
    required this.servicesTitle,
    required this.servicesSubtitle,
    required this.serviceInstallation,
    required this.serviceInstallationDesc,
    required this.serviceMaintenance,
    required this.serviceMaintenanceDesc,
    required this.serviceRepair,
    required this.serviceRepairDesc,
    required this.serviceRefill,
    required this.serviceRefillDesc,
    required this.serviceDemount,
    required this.serviceDemountDesc,
    required this.serviceConsultation,
    required this.serviceConsultationDesc,
    required this.serviceInstallHeading,
    required this.serviceInstallText,
    required this.serviceDetailStandardTitle,
    required this.serviceDetailStandardDescription,
    required this.serviceDetailAdvancedTitle,
    required this.serviceDetailAdvancedDescription,
    required this.serviceDetailMultiTitle,
    required this.serviceDetailMultiDescription,
    required this.serviceDetailPremiumTitle,
    required this.serviceDetailPremiumDescription,
    required this.serviceDetailStandardPrice,
    required this.serviceDetailAdvancedPrice,
    required this.serviceDetailMultiPrice,
    required this.serviceDetailPremiumPrice,
    required this.serviceDetailCleaningBasicPrice,
    required this.serviceDetailCleaningDeepPrice,
    required this.serviceDetailDiagnosticsPrice,
    required this.serviceDetailCompressorPrice,
    required this.serviceDetailBoardPrice,
    required this.serviceDetailFreonPrice,
    required this.serviceMaintenanceSubtitleDetailed,
    required this.serviceMaintenanceHeading,
    required this.serviceMaintenanceText,
    required this.serviceDetailCleaningBasicTitle,
    required this.serviceDetailCleaningBasicDescription,
    required this.serviceDetailCleaningDeepTitle,
    required this.serviceDetailCleaningDeepDescription,
    required this.serviceDetailDiagnosticsTitle,
    required this.serviceDetailDiagnosticsDescription,
    required this.serviceRepairSubtitleDetailed,
    required this.serviceDetailCompressorTitle,
    required this.serviceDetailCompressorDescription,
    required this.serviceDetailBoardTitle,
    required this.serviceDetailBoardDescription,
    required this.serviceDetailFreonTitle,
    required this.serviceDetailFreonDescription,
    required this.priceListTitle,
    required this.priceListSubtitle,
    required this.priceButton,
    required this.priceInstallStandard,
    required this.priceInstallEconomy,
    required this.priceInstallComfort,
    required this.priceInstallMulti,
    required this.priceDemount,
    required this.priceRefill,
    required this.priceCleaning,
    required this.galleryTitle,
    required this.gallerySubtitle,
    required this.galleryAll,
    required this.galleryInstallation,
    required this.galleryMaintenance,
    required this.galleryRepair,
    required this.galleryStatsTitle,
    required this.galleryStatsSectionTitle,
    required this.galleryStatInstallations,
    required this.galleryStatInstallationsSubtitle,
    required this.galleryStatServiced,
    required this.galleryStatServicedSubtitle,
    required this.galleryStatSupport,
    required this.galleryStatSupportSubtitle,
    required this.galleryStatExperience,
    required this.galleryStatExperienceSubtitle,
    required this.galleryDescription1,
    required this.galleryDescription2,
    required this.galleryDescription3,
    required this.galleryDescription4,
    required this.galleryDescription5,
    required this.galleryDescription6,
    required this.processTitle,
    required this.processSubtitle,
    required this.processStepsTitle,
    required this.processStep1Title,
    required this.processStep1Desc,
    required this.processStep2Title,
    required this.processStep2Desc,
    required this.processStep3Title,
    required this.processStep3Desc,
    required this.processStep4Title,
    required this.processStep4Desc,
    required this.processStep5Title,
    required this.processStep5Desc,
    required this.processBenefitsTitle,
    required this.processBenefitsSubtitle,
    required this.processBenefit1Title,
    required this.processBenefit1Description,
    required this.processBenefit2Title,
    required this.processBenefit2Description,
    required this.processBenefit3Title,
    required this.processBenefit3Description,
    required this.processBenefit4Title,
    required this.processBenefit4Description,
    required this.processFAQTitle,
    required this.processFAQQuestion1,
    required this.processFAQAnswer1,
    required this.processFAQQuestion2,
    required this.processFAQAnswer2,
    required this.processFAQQuestion3,
    required this.processFAQAnswer3,
    required this.contactsTitle,
    required this.contactsSubtitle,
    required this.contactsMapTitle,
    required this.contactsMapSubtitle,
    required this.contactsFormTitle,
    required this.contactsFormSubtitle,
    required this.contactsFormName,
    required this.contactsFormPhone,
    required this.contactsFormEmail,
    required this.contactsFormService,
    required this.contactsFormMessage,
    required this.contactsFormSubmit,
    required this.contactsFormSuccess,
    required this.contactsFormNameError,
    required this.contactsFormPhoneError,
    required this.contactsInfoTitle,
    required this.contactsAddressTitle,
    required this.contactsAddressValue,
    required this.contactsPhoneTitle,
    required this.contactsPhoneValue,
    required this.contactsEmailTitle,
    required this.contactsEmailValue,
    required this.contactsScheduleTitle,
    required this.contactsScheduleValue,
    required this.contactsSocialTitle,
    required this.contactsSocialTelegram,
    required this.contactsSocialWhatsApp,
    required this.contactsSocialVkontakte,
    required this.contactsMapPlaceholderTitle,
    required this.contactsMapPlaceholderSubtitle,
    required this.ctaTitle,
    required this.ctaDescription,
    required this.ctaButtonOrder,
    required this.ctaButtonAllServices,
    required this.error404,
  });

  // Временный метод до генерации кода
  // factory LocalizationAttributes.fromJson(Map<String, dynamic> json) =>
  //     _$LocalizationAttributesFromJson(json);
  // Map<String, dynamic> toJson() => _$LocalizationAttributesToJson(this);
}

/// Тип для локализации из Strapi
typedef StrapiLocalization = StrapiContentItem<LocalizationAttributes>;
typedef StrapiLocalizationResponse = StrapiResponse<StrapiLocalization>;
