import 'package:flutter/material.dart';
import 'package:aircool/models/service_model.dart';

/// Элемент списка цен
class PriceListItem extends StatelessWidget {
  final PriceItemModel service;

  const PriceListItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              service.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Text(
            '${service.price} ₽',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
