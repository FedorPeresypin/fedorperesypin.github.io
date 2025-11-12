import 'package:flutter/material.dart';
import 'package:aircool/config/app_config.dart';
import 'package:aircool/l10n/app_localizations.dart';
import 'package:aircool/features/shared/widgets/section.dart';
import 'package:aircool/features/shared/widgets/content_card.dart';

/// Страница процесса работы
class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= AppConfig.desktopBreakpoint;

    final steps = [
      (
        icon: Icons.phone_in_talk,
        title: AppLocalizations.processStep1Title,
        description: AppLocalizations.processStep1Desc,
      ),
      (
        icon: Icons.engineering,
        title: AppLocalizations.processStep2Title,
        description: AppLocalizations.processStep2Desc,
      ),
      (
        icon: Icons.calculate,
        title: AppLocalizations.processStep3Title,
        description: AppLocalizations.processStep3Desc,
      ),
      (
        icon: Icons.construction,
        title: AppLocalizations.processStep4Title,
        description: AppLocalizations.processStep4Desc,
      ),
      (
        icon: Icons.verified,
        title: AppLocalizations.processStep5Title,
        description: AppLocalizations.processStep5Desc,
      ),
    ];

    final benefits = [
      (
        title: AppLocalizations.processBenefit1Title,
        description: AppLocalizations.processBenefit1Description,
      ),
      (
        title: AppLocalizations.processBenefit2Title,
        description: AppLocalizations.processBenefit2Description,
      ),
      (
        title: AppLocalizations.processBenefit3Title,
        description: AppLocalizations.processBenefit3Description,
      ),
      (
        title: AppLocalizations.processBenefit4Title,
        description: AppLocalizations.processBenefit4Description,
      ),
    ];

    final faqs = [
      (
        question: AppLocalizations.processFAQQuestion1,
        answer: AppLocalizations.processFAQAnswer1,
      ),
      (
        question: AppLocalizations.processFAQQuestion2,
        answer: AppLocalizations.processFAQAnswer2,
      ),
      (
        question: AppLocalizations.processFAQQuestion3,
        answer: AppLocalizations.processFAQAnswer3,
      ),
    ];

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
              AppLocalizations.processTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.processSubtitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                  ),
            ),
            const SizedBox(height: 40),
            Section(
              title: AppLocalizations.processStepsTitle,
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  for (final step in steps)
                    _ProcessStep(
                      icon: step.icon,
                      title: step.title,
                      description: step.description,
                    ),
                ],
              ),
            ),
            Section(
              title: AppLocalizations.processBenefitsTitle,
              subtitle: AppLocalizations.processBenefitsSubtitle,
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  for (final benefit in benefits)
                    _BenefitCard(
                      title: benefit.title,
                      description: benefit.description,
                    ),
                ],
              ),
            ),
            Section(
              title: AppLocalizations.processFAQTitle,
              child: Column(
                children: [
                  for (final faq in faqs)
                    _FAQItem(
                      question: faq.question,
                      answer: faq.answer,
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

class _ProcessStep extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ProcessStep({
    required this.icon,
    required this.title,
    required this.description,
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
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.15),
                    Theme.of(context).colorScheme.primary.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
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
          ],
        ),
      ),
    );
  }
}

class _BenefitCard extends StatelessWidget {
  final String title;
  final String description;

  const _BenefitCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
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
          ],
        ),
      ),
    );
  }
}

class _FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const _FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          title: Text(
            question,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          children: [
            Text(
              answer,
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
