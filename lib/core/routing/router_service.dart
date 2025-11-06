import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aircool/core/routing/app_routes.dart';
import 'package:aircool/core/routing/custom_transition_page.dart' as custom;
import 'package:aircool/core/routing/page_transitions.dart';
import 'package:aircool/features/home/pages/home_page.dart';
import 'package:aircool/features/services/pages/services_page.dart';
import 'package:aircool/features/process/pages/process_page.dart';
import 'package:aircool/features/gallery/pages/gallery_page.dart';
import 'package:aircool/features/contacts/pages/contacts_page.dart';
import 'package:aircool/features/shared/widgets/app_shell.dart';
import 'package:aircool/l10n/app_localizations.dart';

/// Сервис роутинга
class RouterService {
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: AppRoutes.home,
      routes: [
        ShellRoute(
          builder: (context, state, child) => AppShell(child: child),
          routes: [
            GoRoute(
              path: AppRoutes.home,
              pageBuilder: (context, state) => custom.CustomTransitionPage(
                key: state.pageKey,
                child: const HomePage(),
                transitionsBuilder: PageTransitions.slideFromRight,
              ),
            ),
            GoRoute(
              path: AppRoutes.services,
              pageBuilder: (context, state) => custom.CustomTransitionPage(
                key: state.pageKey,
                child: const ServicesPage(),
                transitionsBuilder: PageTransitions.slideFromRight,
              ),
            ),
            GoRoute(
              path: AppRoutes.process,
              pageBuilder: (context, state) => custom.CustomTransitionPage(
                key: state.pageKey,
                child: const ProcessPage(),
                transitionsBuilder: PageTransitions.slideFromRight,
              ),
            ),
            GoRoute(
              path: AppRoutes.gallery,
              pageBuilder: (context, state) => custom.CustomTransitionPage(
                key: state.pageKey,
                child: const GalleryPage(),
                transitionsBuilder: PageTransitions.slideFromRight,
              ),
            ),
            GoRoute(
              path: AppRoutes.contacts,
              pageBuilder: (context, state) => custom.CustomTransitionPage(
                key: state.pageKey,
                child: const ContactsPage(),
                transitionsBuilder: PageTransitions.slideFromRight,
              ),
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text(AppLocalizations.error404),
        ),
      ),
    );
  }
}
