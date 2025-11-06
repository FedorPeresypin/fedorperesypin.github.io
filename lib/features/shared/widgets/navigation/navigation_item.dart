import 'package:flutter/material.dart';
import 'package:aircool/models/nav_item_model.dart';

/// Элемент навигации для десктопа
class NavigationItem extends StatelessWidget {
  final NavItemModel item;
  final bool isSelected;
  final VoidCallback onTap;

  const NavigationItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        gradient: isSelected
            ? LinearGradient(
                colors: [
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.5),
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                width: 1,
              )
            : null,
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.15)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    isSelected ? item.filledIcon : item.outlineIcon,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  item.label,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.8),
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                        letterSpacing: 0.2,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
