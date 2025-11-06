import 'package:flutter/material.dart';

/// Конфигурация темы приложения
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        // Прохладная цветовая палитра
        primary: const Color(0xFF00B4D8), // Яркий голубой
        primaryContainer: const Color(0xFF90E0EF), // Светло-голубой
        secondary: const Color(0xFF0077B6), // Глубокий синий
        secondaryContainer: const Color(0xFFCAF0F8), // Очень светло-голубой
        tertiary: const Color(0xFF0096C7), // Бирюзовый
        surface: const Color(0xFFF8FEFF), // Почти белый с легким голубым оттенком
        surfaceContainerHighest: const Color(0xFFE0F7FA), // Светло-голубой фон
        background: const Color(0xFFFFFFFF), // Чистый белый
        error: const Color(0xFFE63946),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: const Color(0xFF003D5B), // Темно-синий для текста
        onBackground: const Color(0xFF003D5B),
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF8FEFF),
      fontFamily: 'Roboto',
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          height: 1.2,
          letterSpacing: -0.5,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          height: 1.3,
          letterSpacing: -0.3,
        ),
        displaySmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          height: 1.4,
          letterSpacing: -0.2,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 1.4,
        ),
        bodyLarge: TextStyle(fontSize: 16, height: 1.6, letterSpacing: 0.1),
        bodyMedium: TextStyle(fontSize: 14, height: 1.5, letterSpacing: 0.1),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
