import 'package:aircool/l10n/app_localizations.dart';

/// Модель услуги
class ServiceModel {
  final String id;
  final String name;
  final String description;
  final int? price;
  final String icon;

  const ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    this.price,
    required this.icon,
  });
}

/// Модель прайс-листа
class PriceItemModel {
  final String id;
  final String name;
  final int price;

  const PriceItemModel({
    required this.id,
    required this.name,
    required this.price,
  });
}

/// Данные для приложения
class AppData {
  /// Получить список цен (динамически из локализации)
  static List<PriceItemModel> getPriceList() {
    return [
      PriceItemModel(
        id: '1',
        name: AppLocalizations.priceInstallStandard,
        price: 6000,
      ),
      PriceItemModel(
        id: '2',
        name: AppLocalizations.priceInstallEconomy,
        price: 8000,
      ),
      PriceItemModel(
        id: '3',
        name: AppLocalizations.priceInstallComfort,
        price: 10000,
      ),
      PriceItemModel(
        id: '4',
        name: AppLocalizations.priceInstallMulti,
        price: 9000,
      ),
      PriceItemModel(
        id: '5',
        name: AppLocalizations.priceDemount,
        price: 2500,
      ),
      PriceItemModel(
        id: '6',
        name: AppLocalizations.priceRefill,
        price: 4000,
      ),
      PriceItemModel(
        id: '7',
        name: AppLocalizations.priceCleaning,
        price: 3000,
      ),
    ];
  }
}
