import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aircool/core/routing/app_routes.dart';
import 'package:aircool/l10n/app_localizations.dart';
import 'package:aircool/features/shared/widgets/gradient_button.dart';
import 'package:aircool/features/home/widgets/stat_item.dart';

/// Контент Hero секции
class HeroContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.verified, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.heroBadge,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          AppLocalizations.heroTitle,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.heroDescription,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white.withOpacity(0.9),
                height: 1.6,
              ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            GradientButton(
              text: AppLocalizations.heroButtonCalculate,
              onPressed: () => GoRouter.of(context).go(AppRoutes.services),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => GoRouter.of(context).go(AppRoutes.contacts),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 18,
                    ),
                    child: Text(
                      AppLocalizations.heroButtonConsultation,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            StatItem(number: '15+', label: AppLocalizations.statYears),
            const SizedBox(width: 30),
            StatItem(
              number: '2000+',
              label: AppLocalizations.statClients,
            ),
            const SizedBox(width: 30),
            StatItem(number: '24/7', label: AppLocalizations.statSupport),
          ],
        ),
      ],
    );
  }
}
