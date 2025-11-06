import 'package:flutter/material.dart';

/// Кастомная страница с поддержкой переходов для go_router
class CustomTransitionPage extends Page<void> {
  final Widget child;
  final Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) transitionsBuilder;

  const CustomTransitionPage({
    required super.key,
    required this.child,
    required this.transitionsBuilder,
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return PageRouteBuilder<void>(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: transitionsBuilder,
    );
  }
}
