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
        title: 'Заявка',
        description: 'Оставьте заявку на сайте или по телефону. Менеджер свяжется в течение 15 минут для уточнения деталей.'
      ),
      (
        icon: Icons.engineering,
        title: 'Выезд мастера',
        description: 'Бесплатный выезд специалиста на объект для оценки условий монтажа и замеров.'
      ),
      (
        icon: Icons.calculate,
        title: 'Расчет стоимости',
        description: 'Подготавливаем подробную смету с вариантами оборудования и сроками выполнения работ.'
      ),
      (
        icon: Icons.construction,
        title: 'Монтаж',
        description: 'Профессиональный монтаж, подключение, тестирование и инструктаж по эксплуатации.'
      ),
      (
        icon: Icons.verified,
        title: 'Сдача объекта',
        description: 'Контроль качества, финальная проверка и гарантийная документация с рекомендациями по обслуживанию.'
      ),
    ];

    final benefits = [
      (
        title: 'Гарантия на работы',
        description: 'Гарантия 24 месяца на монтаж и сервисные работы. Работаем по договору.'
      ),
      (
        title: 'Прозрачная смета',
        description: 'Подробный расчет без скрытых платежей. Стоимость фиксируется до начала работ.'
      ),
      (
        title: 'Собственные бригады',
        description: 'Опытные специалисты с профильным образованием и допусками.'
      ),
      (
        title: 'Качественные материалы',
        description: 'Используем проверенные бренды оборудования и комплектующих.'
      ),
    ];

    final faqs = [
      (
        question: 'Сколько занимает монтаж кондиционера?',
        answer: 'Стандартный монтаж сплит-системы занимает 3-4 часа. Сложные проекты с трассами могут потребовать до 1 рабочего дня.'
      ),
      (
        question: 'Когда проводить обслуживание кондиционера?',
        answer: 'Рекомендуем проводить сервисное обслуживание два раза в год: перед летним сезоном и после его окончания.'
      ),
      (
        question: 'Какая гарантия предоставляется?',
        answer: 'На монтажные работы — 24 месяца. На оборудование распространяется заводская гарантия производителя.'
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
              title: 'Преимущества сотрудничества',
              subtitle: 'Мы сопровождаем проект на каждом этапе',
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
              title: 'Частые вопросы',
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
