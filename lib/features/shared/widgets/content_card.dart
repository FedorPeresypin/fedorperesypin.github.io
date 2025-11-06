import 'package:flutter/material.dart';

/// Карточка контента с градиентом и тенью
class ContentCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color? color;

  const ContentCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: color != null
            ? LinearGradient(
                colors: [
                  color!,
                  color!.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [
                  Colors.white,
                  Theme.of(context).colorScheme.surfaceContainerHighest,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context)
              .colorScheme
              .primaryContainer
              .withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
