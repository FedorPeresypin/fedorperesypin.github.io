import 'package:flutter/material.dart';
import 'package:aircool/config/app_config.dart';
import 'package:aircool/features/shared/widgets/section.dart';
import 'package:aircool/features/shared/widgets/content_card.dart';
import 'package:aircool/l10n/app_localizations.dart';

/// Галерея выполненных работ
class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= AppConfig.desktopBreakpoint;
    final isTablet = MediaQuery.of(context).size.width >= AppConfig.tabletBreakpoint;

    final categories = [
      AppLocalizations.galleryAll,
      AppLocalizations.galleryInstallation,
      AppLocalizations.galleryMaintenance,
      AppLocalizations.galleryRepair,
    ];

    final descriptions = AppLocalizations.galleryDescriptions;

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
              AppLocalizations.galleryTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.gallerySubtitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                  ),
            ),
            const SizedBox(height: 32),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int index = 0; index < categories.length; index++) ...[
                    FilterChip(
                      label: Text(categories[index]),
                      selected: _selectedCategory == index,
                      onSelected: (_) {
                        setState(() => _selectedCategory = index);
                      },
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      selectedColor: Theme.of(context).colorScheme.primary,
                      labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: _selectedCategory == index
                                ? Colors.white
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 32),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isDesktop
                    ? 3
                    : isTablet
                        ? 2
                        : 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isDesktop ? 1.4 : 1.1,
              ),
              itemCount: AppConfig.sampleImages.length,
              itemBuilder: (context, index) => _GalleryItem(
                imageUrl: AppConfig.sampleImages[index],
                description: descriptions[index % descriptions.length],
              ),
            ),
            const SizedBox(height: 40),
            Section(
              title: AppLocalizations.galleryStatsSectionTitle,
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _StatCard(
                    title: AppLocalizations.galleryStatInstallations,
                    subtitle: AppLocalizations.galleryStatInstallationsSubtitle,
                  ),
                  _StatCard(
                    title: AppLocalizations.galleryStatServiced,
                    subtitle: AppLocalizations.galleryStatServicedSubtitle,
                  ),
                  _StatCard(
                    title: AppLocalizations.galleryStatSupport,
                    subtitle: AppLocalizations.galleryStatSupportSubtitle,
                  ),
                  _StatCard(
                    title: AppLocalizations.galleryStatExperience,
                    subtitle: AppLocalizations.galleryStatExperienceSubtitle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GalleryItem extends StatelessWidget {
  final String imageUrl;
  final String description;

  const _GalleryItem({
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openPreview(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(imageUrl, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              right: 16,
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openPreview(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            InteractiveViewer(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(imageUrl, fit: BoxFit.contain),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.6),
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _StatCard({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: ContentCard(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
