import 'package:flutter/material.dart';
import 'package:aircool/config/app_theme.dart';
import 'package:aircool/core/routing/router_service.dart';
import 'package:aircool/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Инициализируем локализацию из Strapi
  await AppLocalizations.initialize();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = RouterService.createRouter();

    return MaterialApp.router(
      title: AppLocalizations.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}