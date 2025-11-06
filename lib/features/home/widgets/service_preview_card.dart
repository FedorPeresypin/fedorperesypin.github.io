import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aircool/core/routing/app_routes.dart';
import 'package:aircool/features/shared/widgets/content_card.dart';

/// Карточка предпросмотра услуги
class ServicePreviewCard extends StatelessWidget {
  final int index;

  const ServicePreviewCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'icon': Icons.install_desktop,
        'title': 'Установка кондиционеров',
        'desc': 'Профессиональный монтаж любой сложности',
      },
      {
        'icon': Icons.build,
        'title': 'Обслуживание',
        'desc': 'Чистка и профилактика систем',
      },
      {
        'icon': Icons.settings,
        'title': 'Ремонт',
        'desc': 'Быстрое устранение неисправностей',
      },
      {
        'icon': Icons.local_gas_station,
        'title': 'Заправка фреоном',
        'desc': 'Заправка фреоном и хладагентом',
      },
      {
        'icon': Icons.engineering,
        'title': 'Демонтаж',
        'desc': 'Аккуратный демонтаж оборудования',
      },
      {
        'icon': Icons.search,
        'title': 'Диагностика',
        'desc': 'Полная проверка системы',
      },
    ];

    final service = services[index];

    return ContentCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  Theme.of(context).colorScheme.primary.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              service['icon'] as IconData,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            service['title'] as String,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            service['desc'] as String,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => GoRouter.of(context).go(AppRoutes.services),
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              'Подробнее →',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
