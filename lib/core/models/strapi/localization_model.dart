import 'package:json_annotation/json_annotation.dart';
import 'package:aircool/core/models/strapi/strapi_content_item.dart';
import 'package:aircool/core/models/strapi/strapi_response.dart';

part 'localization_model.g.dart'; // Раскомментируйте после генерации кода

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
    required this.ctaTitle,
    required this.ctaDescription,
    required this.ctaButtonOrder,
    required this.ctaButtonAllServices,
    required this.error404,
  });

  // Временный метод до генерации кода
  factory LocalizationAttributes.fromJson(Map<String, dynamic> json) =>
      _$LocalizationAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$LocalizationAttributesToJson(this);
}

/// Тип для локализации из Strapi
typedef StrapiLocalization = StrapiContentItem<LocalizationAttributes>;
typedef StrapiLocalizationResponse = StrapiResponse<StrapiLocalization>;
