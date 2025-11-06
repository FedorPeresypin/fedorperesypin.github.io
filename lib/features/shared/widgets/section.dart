import 'package:flutter/material.dart';

/// Виджет секции с заголовком
class Section extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsets padding;
  final String? subtitle;

  const Section({
    super.key,
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 24),
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.6),
                      ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}
