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
              AppLocalizations.servicesSubtitle,
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
                                AppLocalizations.serviceInstallHeading,
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                AppLocalizations.serviceInstallText,
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
                      children: [
                        _ServiceDetailItem(
                          title: AppLocalizations.serviceDetailStandardTitle,
                          description: AppLocalizations.serviceDetailStandardDescription,
                          price: AppLocalizations.serviceDetailStandardPrice,
                        ),
                        _ServiceDetailItem(
                          title: AppLocalizations.serviceDetailAdvancedTitle,
                          description: AppLocalizations.serviceDetailAdvancedDescription,
                          price: AppLocalizations.serviceDetailAdvancedPrice,
                        ),
                        _ServiceDetailItem(
                          title: AppLocalizations.serviceDetailMultiTitle,
                          description: AppLocalizations.serviceDetailMultiDescription,
                          price: AppLocalizations.serviceDetailMultiPrice,
                        ),
                        _ServiceDetailItem(
                          title: AppLocalizations.serviceDetailPremiumTitle,
                          description: AppLocalizations.serviceDetailPremiumDescription,
                          price: AppLocalizations.serviceDetailPremiumPrice,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Обслуживание и чистка
            Section(
              title: AppLocalizations.serviceMaintenance,
              subtitle: AppLocalizations.serviceMaintenanceSubtitleDetailed,
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
                                AppLocalizations.serviceMaintenanceHeading,
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: Theme.of(context).colorScheme.secondary,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                AppLocalizations.serviceMaintenanceText,
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
                      children: [
                        _ServiceDetailItem(
                          title: AppLocalizations.serviceDetailCleaningBasicTitle,
                          description: AppLocalizations.serviceDetailCleaningBasicDescription,
                          price: AppLocalizations.serviceDetailCleaningBasicPrice,
                        ),
                        _ServiceDetailItem(
                          title: AppLocalizations.serviceDetailCleaningDeepTitle,
                          description: AppLocalizations.serviceDetailCleaningDeepDescription,
                          price: AppLocalizations.serviceDetailCleaningDeepPrice,
                        ),
                        _ServiceDetailItem(
                          title: AppLocalizations.serviceDetailDiagnosticsTitle,
                          description: AppLocalizations.serviceDetailDiagnosticsDescription,
                          price: AppLocalizations.serviceDetailDiagnosticsPrice,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Ремонт
            Section(
              title: AppLocalizations.serviceRepair,
              subtitle: AppLocalizations.serviceRepairSubtitleDetailed,
              child: ContentCard(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _ServiceDetailItem(
                      title: AppLocalizations.serviceDetailCompressorTitle,
                      description: AppLocalizations.serviceDetailCompressorDescription,
                      price: AppLocalizations.serviceDetailCompressorPrice,
                    ),
                    _ServiceDetailItem(
                      title: AppLocalizations.serviceDetailBoardTitle,
                      description: AppLocalizations.serviceDetailBoardDescription,
                      price: AppLocalizations.serviceDetailBoardPrice,
                    ),
                    _ServiceDetailItem(
                      title: AppLocalizations.serviceDetailFreonTitle,
                      description: AppLocalizations.serviceDetailFreonDescription,
                      price: AppLocalizations.serviceDetailFreonPrice,
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
