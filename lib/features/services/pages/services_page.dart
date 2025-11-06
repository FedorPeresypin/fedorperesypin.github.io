import 'package:flutter/material.dart';
import 'package:aircool/config/app_config.dart';
import 'package:aircool/l10n/app_localizations.dart';
import 'package:aircool/features/shared/widgets/section.dart';
import 'package:aircool/features/shared/widgets/content_card.dart';

/// Страница услуг
class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= AppConfig.desktopBreakpoint;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : 20,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.servicesTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Полный спектр услуг по установке и обслуживанию климатической техники',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                  ),
            ),
            const SizedBox(height: 40),

            // Установка кондиционеров
            Section(
              title: AppLocalizations.serviceInstallation,
              subtitle: AppLocalizations.serviceInstallationDesc,
              child: ContentCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).colorScheme.primary,
                                Theme.of(context).colorScheme.primary.withOpacity(0.8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.install_desktop,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Полный комплекс работ по монтажу',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Мы осуществляем профессиональный монтаж кондиционеров всех типов: настенные сплит-системы, кассетные, канальные, напольно-потолочные и мульти-сплит системы. Каждый монтаж включает полный комплекс работ с гарантией качества.',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: const [
                        _ServiceDetailItem(
                          title: 'Стандартный монтаж',
                          description: 'Установка внутреннего и внешнего блоков, подключение коммуникаций',
                          price: 'от 6 000 ₽',
                        ),
                        _ServiceDetailItem(
                          title: 'Сложный монтаж',
                          description: 'Дополнительные работы: штробление стен, протяжка трасс более 5м',
                          price: 'от 10 000 ₽',
                        ),
                        _ServiceDetailItem(
                          title: 'Мульти-сплит системы',
                          description: 'Установка систем с несколькими внутренними блоками',
                          price: 'от 15 000 ₽',
                        ),
                        _ServiceDetailItem(
                          title: 'Премиум монтаж',
                          description: 'Полный комплекс работ с использованием премиальных материалов',
                          price: 'от 20 000 ₽',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Обслуживание и чистка
            Section(
              title: 'Обслуживание и чистка',
              subtitle: 'Регулярное обслуживание для долговечной работы',
              child: ContentCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).colorScheme.secondary,
                                Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.cleaning_services,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Комплексное сервисное обслуживание',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: Theme.of(context).colorScheme.secondary,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Регулярная чистка и профилактика предотвращает поломки, снижает расход электроэнергии и повышает эффективность системы. Мы используем безопасные моющие средства и профессиональное оборудование.',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: const [
                        _ServiceDetailItem(
                          title: 'Базовая чистка',
                          description: 'Очистка фильтров, дезинфекция испарителя',
                          price: 'от 1 500 ₽',
                        ),
                        _ServiceDetailItem(
                          title: 'Глубокая чистка',
                          description: 'Разборка внутреннего блока, химическая чистка теплообменника',
                          price: 'от 3 000 ₽',
                        ),
                        _ServiceDetailItem(
                          title: 'Диагностика',
                          description: 'Проверка давления хладагента, электроники и дренажа',
                          price: 'от 1 000 ₽',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Ремонт
            Section(
              title: 'Ремонт',
              subtitle: 'Быстрое и качественное устранение неисправностей',
              child: ContentCard(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: const [
                    _ServiceDetailItem(
                      title: 'Замена компрессора',
                      description: 'Подбор и замена компрессора, проверка герметичности',
                      price: 'от 8 000 ₽',
                    ),
                    _ServiceDetailItem(
                      title: 'Ремонт платы управления',
                      description: 'Диагностика и ремонт электроники, прошивка',
                      price: 'от 6 000 ₽',
                    ),
                    _ServiceDetailItem(
                      title: 'Заправка фреоном',
                      description: 'Поиск утечек, вакуумирование, дозаправка',
                      price: 'от 2 500 ₽',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceDetailItem extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  const _ServiceDetailItem({
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: ContentCard(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              price,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
