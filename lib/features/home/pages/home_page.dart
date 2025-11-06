import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aircool/config/app_config.dart';
import 'package:aircool/core/routing/app_routes.dart';
import 'package:aircool/l10n/app_localizations.dart';
import 'package:aircool/models/service_model.dart';
import 'package:aircool/models/app_data.dart';
import 'package:aircool/features/shared/widgets/section.dart';
import 'package:aircool/features/shared/widgets/content_card.dart';
import 'package:aircool/features/shared/widgets/gradient_button.dart';
import 'package:aircool/features/home/widgets/hero_section.dart';
import 'package:aircool/features/home/widgets/service_preview_card.dart';
import 'package:aircool/features/home/widgets/price_list_item.dart';
import 'package:aircool/features/home/widgets/gallery_preview_item.dart';
import 'package:aircool/features/home/widgets/feature_chip.dart';

/// Главная страница
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.of(context).size.width >= AppConfig.desktopBreakpoint;
    final isTablet =
        MediaQuery.of(context).size.width >= AppConfig.tabletBreakpoint;

    return SingleChildScrollView(
      child: Column(
        children: [
          HeroSection(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 80 : 20,
              vertical: 60,
            ),
            child: Column(
              children: [
                Section(
                  title: AppLocalizations.aboutTitle,
                  subtitle: AppLocalizations.aboutSubtitle,
                  child: ContentCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.aboutDescription,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            FeatureChip(
                              icon: Icons.verified,
                              text: AppLocalizations.featureGuarantee,
                            ),
                            FeatureChip(
                              icon: Icons.engineering,
                              text: AppLocalizations.featureMasters,
                            ),
                            FeatureChip(
                              icon: Icons.schedule,
                              text: AppLocalizations.featureSchedule,
                            ),
                            FeatureChip(
                              icon: Icons.thumb_up,
                              text: AppLocalizations.featureQuality,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Section(
                  title: AppLocalizations.servicesTitle,
                  subtitle: 'Полный спектр услуг по доступным ценам',
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isDesktop ? 3 : isTablet ? 2 : 1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) =>
                        ServicePreviewCard(index: index),
                  ),
                ),
                Section(
                  title: AppLocalizations.priceListTitle,
                  subtitle: AppLocalizations.priceListSubtitle,
                  child: ContentCard(
                    child: Column(
                      children: [
                        for (final service in AppData.getPriceList())
                          PriceListItem(service: service),
                        const SizedBox(height: 20),
                        GradientButton(
                          text: AppLocalizations.priceButton,
                          onPressed: () =>
                              GoRouter.of(context).go(AppRoutes.contacts),
                          fullWidth: true,
                        ),
                      ],
                    ),
                  ),
                ),
                Section(
                  title: AppLocalizations.galleryTitle,
                  subtitle: AppLocalizations.gallerySubtitle,
                  child: SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: AppConfig.sampleImages.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, index) => GalleryPreviewItem(
                        imageUrl: AppConfig.sampleImages[index],
                      ),
                    ),
                  ),
                ),
                ContentCard(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(0.1),
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.ctaTitle,
                        style: Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        AppLocalizations.ctaDescription,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          GradientButton(
                            text: AppLocalizations.ctaButtonOrder,
                            onPressed: () =>
                                GoRouter.of(context).go(AppRoutes.contacts),
                          ),
                          OutlinedButton(
                            onPressed: () =>
                                GoRouter.of(context).go(AppRoutes.services),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(AppLocalizations.ctaButtonAllServices),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
