import 'package:flutter/material.dart';

/// Переходы между страницами
class PageTransitions {
  static Widget slideFromRight(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const curve = Curves.easeInOutCubic;

    // Анимация для текущей страницы (вход)
    final enterAnimation = CurvedAnimation(parent: animation, curve: curve);

    // Анимация для предыдущей страницы (выход)
    final exitAnimation = CurvedAnimation(
      parent: secondaryAnimation,
      curve: curve,
    );

    return Stack(
      children: [
        // Уходящая страница - плавно исчезает
        FadeTransition(
          opacity: ReverseAnimation(exitAnimation),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),

        // Новая страница - появляется с правой стороны
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(enterAnimation),
          child: FadeTransition(
            opacity: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(enterAnimation),
            child: child,
          ),
        ),
      ],
    );
  }
}
