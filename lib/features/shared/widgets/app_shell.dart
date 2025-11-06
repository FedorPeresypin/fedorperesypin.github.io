import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aircool/config/app_config.dart';
import 'package:aircool/core/routing/app_routes.dart';
import 'package:aircool/l10n/app_localizations.dart';
import 'package:aircool/models/nav_item_model.dart';
import 'package:aircool/features/shared/widgets/navigation/navigation_item.dart';
import 'package:aircool/features/shared/widgets/navigation/bottom_nav_item.dart';
import 'package:aircool/features/shared/widgets/navigation/app_header.dart';

/// Оболочка приложения с навигацией
class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  static final List<NavItemModel> items = [
    NavItemModel(
      label: AppLocalizations.navHome,
      path: AppRoutes.home,
      outlineIcon: Icons.home_outlined,
      filledIcon: Icons.home,
    ),
    NavItemModel(
      label: AppLocalizations.navServices,
      path: AppRoutes.services,
      outlineIcon: Icons.construction_outlined,
      filledIcon: Icons.construction,
    ),
    NavItemModel(
      label: AppLocalizations.navProcess,
      path: AppRoutes.process,
      outlineIcon: Icons.timeline_outlined,
      filledIcon: Icons.timeline,
    ),
    NavItemModel(
      label: AppLocalizations.navGallery,
      path: AppRoutes.gallery,
      outlineIcon: Icons.photo_library_outlined,
      filledIcon: Icons.photo_library,
    ),
    NavItemModel(
      label: AppLocalizations.navContacts,
      path: AppRoutes.contacts,
      outlineIcon: Icons.contact_mail_outlined,
      filledIcon: Icons.contact_mail,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.of(context).size.width >= AppConfig.desktopBreakpoint;
    final location = GoRouterState.of(context).uri.toString();
    final selected = items.indexWhere(
      (it) => location == it.path || location.startsWith(it.path + '/'),
    );
    final selectedIndex = selected == -1 ? 0 : selected;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop) _buildDesktopSidebar(context, selectedIndex),
            Expanded(child: _buildMainContent(context)),
          ],
        ),
      ),
      bottomNavigationBar:
          !isDesktop ? _buildBottomNavigation(context, selectedIndex) : null,
    );
  }

  Widget _buildDesktopSidebar(BuildContext context, int selectedIndex) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.9),
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border(
          right: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .primaryContainer
                .withOpacity(0.2),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(4, 0),
            spreadRadius: -2,
          ),
        ],
      ),
      child: Column(
        children: [
          AppHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                for (int i = 0; i < items.length; i++)
                  NavigationItem(
                    item: items[i],
                    isSelected: selectedIndex == i,
                    onTap: () => GoRouter.of(context).go(items[i].path),
                  ),
              ],
            ),
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.background,
            Theme.of(context).colorScheme.background.withOpacity(0.95),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }

  Widget _buildBottomNavigation(BuildContext context, int selectedIndex) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.95),
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border(
          top: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .primaryContainer
                .withOpacity(0.2),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
            spreadRadius: -2,
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: items.map((item) {
              final isSelected = selectedIndex == items.indexOf(item);
              return Expanded(
                child: BottomNavItem(
                  item: item,
                  isSelected: isSelected,
                  onTap: () => GoRouter.of(context).go(item.path),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        AppLocalizations.footerText,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color:
                  Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
