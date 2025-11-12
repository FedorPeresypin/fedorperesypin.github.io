import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        ShellRoute(
          builder: (context, state, child) => AppShell(child: child),
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const HomePage(),
                transitionsBuilder: _slideFromRightTransition,
              ),
            ),
            GoRoute(
              path: '/services',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const ServicesPage(),
                transitionsBuilder: _slideFromRightTransition,
              ),
            ),
            GoRoute(
              path: '/process',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const ProcessPage(),
                transitionsBuilder: _slideFromRightTransition,
              ),
            ),
            GoRoute(
              path: '/gallery',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const GalleryPage(),
                transitionsBuilder: _slideFromRightTransition,
              ),
            ),
            GoRoute(
              path: '/contacts',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const ContactsPage(),
                transitionsBuilder: _slideFromRightTransition,
              ),
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) =>
          const Scaffold(body: Center(child: Text('Страница не найдена'))),
    );

    return MaterialApp.router(
      title: 'Скиданов Сервис — Нижний Новгород',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0066CC),
          brightness: Brightness.light,
        ),
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
          ),
          displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.3,
          ),
          displaySmall: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          bodyLarge: TextStyle(fontSize: 16, height: 1.6),
          bodyMedium: TextStyle(fontSize: 14, height: 1.5),
        ),
      ),
      routerConfig: router,
    );
  }

  static Widget _slideFromRightTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const curve = Curves.easeInOutCubic;
    const duration = Duration(milliseconds: 400);

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
          child: Container(color: Theme.of(context).scaffoldBackgroundColor),
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

  // Альтернативная анимация - плавное масштабирование
  static Widget _scaleTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const curve = Curves.fastEaseInToSlowEaseOut;
    const duration = Duration(milliseconds: 500);

    final enterAnimation = CurvedAnimation(parent: animation, curve: curve);

    return Stack(
      children: [
        // Фон для предотвращения наложения
        Container(color: Theme.of(context).scaffoldBackgroundColor),

        // Основная анимация масштабирования
        ScaleTransition(
          scale: Tween<double>(begin: 0.9, end: 1.0).animate(enterAnimation),
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

  // Анимация с градиентным переходом
  static Widget _gradientTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const curve = Curves.easeInOutQuart;

    final enterAnimation = CurvedAnimation(parent: animation, curve: curve);

    return AnimatedBuilder(
      animation: enterAnimation,
      builder: (context, child) {
        return Stack(
          children: [
            // Градиентный фон
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(
                      context,
                    ).colorScheme.background.withOpacity(enterAnimation.value),
                    Theme.of(
                      context,
                    ).colorScheme.surface.withOpacity(enterAnimation.value),
                  ],
                ),
              ),
            ),

            // Контент с плавным появлением
            Transform.translate(
              offset: Offset(0.0, 50 * (1 - enterAnimation.value)),
              child: Opacity(opacity: enterAnimation.value, child: child),
            ),
          ],
        );
      },
      child: child,
    );
  }
}

// ---------- Shell with improved navigation ----------
class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  static final items = [
    _NavItem('Главная', '/', Icons.home_outlined, Icons.home),
    _NavItem(
      'Услуги',
      '/services',
      Icons.construction_outlined,
      Icons.construction,
    ),
    _NavItem('Процесс', '/process', Icons.timeline_outlined, Icons.timeline),
    _NavItem(
      'Галерея',
      '/gallery',
      Icons.photo_library_outlined,
      Icons.photo_library,
    ),
    _NavItem(
      'Контакты',
      '/contacts',
      Icons.contact_mail_outlined,
      Icons.contact_mail,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final location = GoRouterState.of(context).uri.toString();
    final selected = items.indexWhere(
      (it) => location == it.path || location.startsWith(it.path + '/'),
    );
    final selectedIndex = selected == -1 ? 0 : selected;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              Container(
                width: 280,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.surface,
                      Theme.of(context).colorScheme.surface.withOpacity(0.95),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(2, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Header
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 20,
                      ),
                      child: InkWell(
                        onTap: () => GoRouter.of(context).go('/'),
                        borderRadius: BorderRadius.circular(16),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context).colorScheme.primary,
                                    Theme.of(
                                      context,
                                    ).colorScheme.primary.withOpacity(0.8),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.ac_unit,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Скиданов Сервис',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Нижний Новгород',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface.withOpacity(0.6),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Navigation
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        children: [
                          for (int i = 0; i < items.length; i++)
                            _NavigationItem(
                              item: items[i],
                              isSelected: selectedIndex == i,
                              onTap: () =>
                                  GoRouter.of(context).go(items[i].path),
                            ),
                        ],
                      ),
                    ),

                    // Footer
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        '© 2024 Скиданов Сервис',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.5),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

            // Main content
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.background,
                      Theme.of(
                        context,
                      ).colorScheme.background.withOpacity(0.95),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),

      // Mobile bottom navigation
      bottomNavigationBar: !isDesktop
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.surface,
                    Theme.of(context).colorScheme.surface.withOpacity(0.95),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
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
                        child: _BottomNavItem(
                          item: item,
                          isSelected: isSelected,
                          onTap: () => GoRouter.of(context).go(item.path),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

class _NavItem {
  final String label;
  final String path;
  final IconData outlineIcon;
  final IconData filledIcon;
  const _NavItem(this.label, this.path, this.outlineIcon, this.filledIcon);
}

class _NavigationItem extends StatelessWidget {
  final _NavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavigationItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: isSelected
            ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Icon(
                  isSelected ? item.filledIcon : item.outlineIcon,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.6),
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  item.label,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.8),
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
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

class _BottomNavItem extends StatelessWidget {
  final _NavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? item.filledIcon : item.outlineIcon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Shared content constants ----------
const companyName = 'Скиданов Сервис';
const region = 'Нижний Новгород';
const footerText = '© 2024 Скиданов Сервис — Все права защищены';

const sampleImages = [
  'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500',
  'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=500',
  'https://images.unsplash.com/photo-1601134467661-3d775b999c8b?w=500',
  'https://images.unsplash.com/photo-1545128485-c400e7702796?w=500',
  'https://images.unsplash.com/photo-1581094794329-c8112a89af24?w=500',
  'https://images.unsplash.com/photo-1581094794329-c8112a89af24?w=500',
];

final priceList = [
  {'name': 'Установка сплит-системы (стандарт)', 'price': 6000},
  {'name': 'Установка кондиционера до 3.5 кВт (эконом)', 'price': 8000},
  {'name': 'Установка кондиционера до 5.0 кВт (комфорт)', 'price': 10000},
  {'name': 'Установка мульти-сплит (за блок)', 'price': 9000},
  {'name': 'Демонтаж старого кондиционера', 'price': 2500},
  {'name': 'Пуско-наладка и заправка фреоном (1 контур)', 'price': 4000},
  {'name': 'Чистка и сервис (сплит-система)', 'price': 3000},
];

// ---------- Utility widgets ----------
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
                    color: Theme.of(
                      context,
                    ).colorScheme.onBackground.withOpacity(0.6),
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
                colors: [color!, color!.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surface.withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool fullWidth;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------- Pages ----------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 80 : 20,
                  vertical: isDesktop ? 80 : 40,
                ),
                child: Column(
                  children: [
                    if (isDesktop)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _HeroContent()),
                          const SizedBox(width: 60),
                          SizedBox(width: 500, child: _HeroVisual()),
                        ],
                      )
                    else
                      Column(
                        children: [
                          _HeroContent(),
                          const SizedBox(height: 40),
                          _HeroVisual(),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),

          // Main Content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 80 : 20,
              vertical: 60,
            ),
            child: Column(
              children: [
                // About Section
                Section(
                  title: 'О компании',
                  subtitle:
                      'Более 15 лет профессиональной работы в Нижнем Новгороде',
                  child: ContentCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Скиданов Сервис — это команда профессионалов с многолетним опытом работы в области климатической техники. Мы специализируемся на установке, обслуживании и ремонте кондиционеров любой сложности.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _FeatureChip(
                              icon: Icons.verified,
                              text: 'Гарантия 2 года',
                            ),
                            _FeatureChip(
                              icon: Icons.engineering,
                              text: 'Опытные мастера',
                            ),
                            _FeatureChip(
                              icon: Icons.schedule,
                              text: 'Работаем 24/7',
                            ),
                            _FeatureChip(
                              icon: Icons.thumb_up,
                              text: '100% качество',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Services Preview
                Section(
                  title: 'Наши услуги',
                  subtitle: 'Полный спектр услуг по доступным ценам',
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isDesktop
                          ? 3
                          : isTablet
                          ? 2
                          : 1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) =>
                        _ServicePreviewCard(index: index),
                  ),
                ),

                // Price List
                Section(
                  title: 'Прайс-лист',
                  subtitle: 'Прозрачные цены без скрытых платежей',
                  child: ContentCard(
                    child: Column(
                      children: [
                        for (final service in priceList)
                          _PriceListItem(service: service),
                        const SizedBox(height: 20),
                        GradientButton(
                          text: 'Получить подробный расчет',
                          onPressed: () => GoRouter.of(context).go('/contacts'),
                          fullWidth: true,
                        ),
                      ],
                    ),
                  ),
                ),

                // Gallery Preview
                Section(
                  title: 'Примеры работ',
                  subtitle: 'Реализованные проекты в Нижнем Новгороде',
                  child: SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: sampleImages.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, index) =>
                          _GalleryPreviewItem(imageUrl: sampleImages[index]),
                    ),
                  ),
                ),

                // CTA Section
                ContentCard(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  child: Column(
                    children: [
                      Text(
                        'Готовы начать проект?',
                        style: Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Оставьте заявку и получите бесплатную консультацию нашего специалиста',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          GradientButton(
                            text: 'Заказать замер',
                            onPressed: () =>
                                GoRouter.of(context).go('/contacts'),
                          ),
                          OutlinedButton(
                            onPressed: () =>
                                GoRouter.of(context).go('/services'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Все услуги',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Профессиональный монтаж кондиционеров',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Климатические системы для вашего комфорта',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Более 15 лет устанавливаем и обслуживаем кондиционеры в Нижнем Новгороде. Гарантия качества, доступные цены и профессиональный подход.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white.withOpacity(0.9),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            GradientButton(
              text: 'Рассчитать стоимость',
              onPressed: () => GoRouter.of(context).go('/services'),
            ),
            OutlinedButton(
              onPressed: () => GoRouter.of(context).go('/contacts'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Бесплатная консультация',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            _StatItem(number: '15+', label: 'Лет опыта'),
            const SizedBox(width: 30),
            _StatItem(number: '2000+', label: 'Довольных клиентов'),
            const SizedBox(width: 30),
            _StatItem(number: '24/7', label: 'Поддержка'),
          ],
        ),
      ],
    );
  }
}

class _HeroVisual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=600',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: ContentCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Установка от 6 000 ₽',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Быстрый и аккуратный монтаж с гарантией 2 года',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;

  const _StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Theme.of(context).colorScheme.primary.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 6),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ServicePreviewCard extends StatelessWidget {
  final int index;

  const _ServicePreviewCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'icon': Icons.install_desktop,
        'title': 'Установка кондиционеров',
        'desc': 'Профессиональный монтаж любой сложности',
      },
      {
        'icon': Icons.build,
        'title': 'Обслуживание',
        'desc': 'Чистка и профилактика систем',
      },
      {
        'icon': Icons.settings,
        'title': 'Ремонт',
        'desc': 'Быстрое устранение неисправностей',
      },
      {
        'icon': Icons.local_gas_station,
        'title': 'Заправка фреоном',
        'desc': 'Заправка фреоном и хладагентом',
      },
      {
        'icon': Icons.engineering,
        'title': 'Демонтаж',
        'desc': 'Аккуратный демонтаж оборудования',
      },
      {
        'icon': Icons.search,
        'title': 'Диагностика',
        'desc': 'Полная проверка системы',
      },
    ];

    final service = services[index];

    return ContentCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  Theme.of(context).colorScheme.primary.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              service['icon'] as IconData,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            service['title'] as String,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            service['desc'] as String,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => GoRouter.of(context).go('/services'),
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              'Подробнее →',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceListItem extends StatelessWidget {
  final Map<String, dynamic> service;

  const _PriceListItem({required this.service});

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
              service['name'] as String,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Text(
            '${service['price']} ₽',
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

class _GalleryPreviewItem extends StatelessWidget {
  final String imageUrl;

  const _GalleryPreviewItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).go('/gallery'),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            ),
          ),
          child: const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.zoom_in, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------- Services Page ----------
class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : 20,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Наши услуги',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Полный спектр услуг по установке и обслуживанию климатической техники',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onBackground.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 40),

            // Установка кондиционеров
            Section(
              title: 'Установка кондиционеров',
              subtitle: 'Профессиональный монтаж любой сложности',
              child: ContentCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).colorScheme.primary,
                                Theme.of(
                                  context,
                                ).colorScheme.primary.withOpacity(0.8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.install_desktop,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Полный комплекс работ по монтажу',
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Мы осуществляем профессиональный монтаж кондиционеров всех типов: настенные сплит-системы, кассетные, канальные, напольно-потолочные и мульти-сплит системы. Каждый монтаж включает полный комплекс работ с гарантией качества.',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _ServiceDetailItem(
                          title: 'Стандартный монтаж',
                          description:
                              'Установка внутреннего и внешнего блоков, подключение коммуникаций',
                          price: 'от 6 000 ₽',
                        ),
                        _ServiceDetailItem(
                          title: 'Сложный монтаж',
                          description:
                              'Дополнительные работы: штробление стен, протяжка трасс более 5м',
                          price: 'от 10 000 ₽',
                        ),
                        _ServiceDetailItem(
                          title: 'Мульти-сплит системы',
                          description:
                              'Установка систем с несколькими внутренними блоками',
                          price: 'от 15 000 ₽',
                        ),
                        _ServiceDetailItem(
                          title: 'Премиум монтаж',
                          description:
                              'Полный комплекс работ с использованием премиальных материалов',
                          price: 'от 20 000 ₽',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Обслуживание и чистка
            Section(
              title: 'Обслуживание и чистка',
              subtitle: 'Регулярное обслуживание для долговечной работы',
              child: ContentCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).colorScheme.secondary,
                                Theme.of(
                                  context,
                                ).colorScheme.secondary.withOpacity(0.8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.cleaning_services,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Комплексное обслуживание систем',
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Регулярное обслуживание кондиционеров необходимо для поддержания их эффективности и предотвращения поломок. Мы предлагаем полный спектр сервисных работ.',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _ServiceFeatureItem(
                                'Чистка теплообменников',
                                'Восстановление эффективности теплообмена',
                              ),
                              _ServiceFeatureItem(
                                'Дезинфекция дренажной системы',
                                'Устранение бактерий и неприятных запахов',
                              ),
                              _ServiceFeatureItem(
                                'Замена фильтров',
                                'Очистка воздуха от пыли и аллергенов',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _ServiceFeatureItem(
                                'Проверка давления фреона',
                                'Оптимальные параметры работы системы',
                              ),
                              _ServiceFeatureItem(
                                'Диагностика электроники',
                                'Предотвращение сбоев в работе',
                              ),
                              _ServiceFeatureItem(
                                'Смазка вентиляторов',
                                'Бесшумная работа компонентов',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Ремонт кондиционеров
            Section(
              title: 'Ремонт кондиционеров',
              subtitle: 'Быстрое устранение любых неисправностей',
              child: ContentCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.orange,
                                Colors.orange.withOpacity(0.8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.build,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Качественный ремонт любой сложности',
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(color: Colors.orange),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Мы осуществляем ремонт кондиционеров всех марок и моделей. Используем только оригинальные запчасти и современное диагностическое оборудование.',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isDesktop ? 3 : 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        final repairs = [
                          {
                            'title': 'Ремонт компрессора',
                            'issues': ['Перегрев', 'Шум', 'Не запускается'],
                            'price': 'от 8 000 ₽',
                          },
                          {
                            'title': 'Замена вентилятора',
                            'issues': ['Шум', 'Вибрация', 'Не вращается'],
                            'price': 'от 4 000 ₽',
                          },
                          {
                            'title': 'Ремонт платы управления',
                            'issues': [
                              'Не включается',
                              'Сбои в работе',
                              'Ошибки на дисплее',
                            ],
                            'price': 'от 6 000 ₽',
                          },
                          {
                            'title': 'Устранение утечки фреона',
                            'issues': [
                              'Плохо охлаждает',
                              'Обмерзание',
                              'Пониженное давление',
                            ],
                            'price': 'от 3 000 ₽',
                          },
                          {
                            'title': 'Чистка дренажа',
                            'issues': ['Течет вода', 'Запах', 'Забит дренаж'],
                            'price': 'от 2 000 ₽',
                          },
                          {
                            'title': 'Настройка и диагностика',
                            'issues': [
                              'Неправильная работа',
                              'Настройка режимов',
                              'Полная диагностика',
                            ],
                            'price': 'от 1 500 ₽',
                          },
                        ];
                        final repair = repairs[index];
                        return _RepairServiceCard(repair: repair);
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Дополнительные услуги
            Section(
              title: 'Дополнительные услуги',
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _AdditionalServiceCard(
                    icon: Icons.local_gas_station,
                    title: 'Заправка фреоном',
                    description:
                        'Профессиональная заправка хладагентом с проверкой на утечки',
                    price: 'от 2 500 ₽',
                    color: Colors.green,
                  ),
                  _AdditionalServiceCard(
                    icon: Icons.engineering,
                    title: 'Демонтаж и перенос',
                    description:
                        'Аккуратный демонтаж и установка на новом месте',
                    price: 'от 4 000 ₽',
                    color: Colors.blue,
                  ),
                  _AdditionalServiceCard(
                    icon: Icons.search,
                    title: 'Диагностика',
                    description: 'Полная диагностика системы кондиционирования',
                    price: 'от 1 000 ₽',
                    color: Colors.purple,
                  ),
                  _AdditionalServiceCard(
                    icon: Icons.security,
                    title: 'Гарантийное обслуживание',
                    description:
                        'Обслуживание оборудования в гарантийный период',
                    price: 'от 2 000 ₽',
                    color: Colors.red,
                  ),
                ],
              ),
            ),

            // CTA Section
            ContentCard(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              child: Column(
                children: [
                  Text(
                    'Нужна консультация по услугам?',
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Наши специалисты помогут подобрать оптимальное решение для вашего объекта',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  GradientButton(
                    text: 'Получить консультацию',
                    onPressed: () => GoRouter.of(context).go('/contacts'),
                    fullWidth: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceDetailItem extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  const _ServiceDetailItem({
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.surface.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            price,
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

class _ServiceFeatureItem extends StatelessWidget {
  final String title;
  final String description;

  const _ServiceFeatureItem(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RepairServiceCard extends StatelessWidget {
  final Map<String, dynamic> repair;

  const _RepairServiceCard({required this.repair});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.surface.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            repair['title'] as String,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (repair['issues'] as List)
                .map<Widget>(
                  (issue) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      '• $issue',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const Spacer(),
          Text(
            repair['price'] as String,
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

class _AdditionalServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String price;
  final Color color;

  const _AdditionalServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            price,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Process Page ----------
class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : 20,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Процесс работы',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Четкий алгоритм действий от заявки до сдачи объекта',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onBackground.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 40),

            // Steps
            Section(
              title: 'Этапы сотрудничества',
              child: Column(
                children: [
                  _ProcessStep(
                    number: 1,
                    title: 'Заявка и консультация',
                    description:
                        'Вы оставляете заявку на сайте или по телефону. Наш специалист связывается с вами для уточнения деталей и проведения бесплатной консультации.',
                    icon: Icons.phone_in_talk,
                    color: Colors.blue,
                  ),
                  _ProcessStep(
                    number: 2,
                    title: 'Выезд специалиста и замеры',
                    description:
                        'Инженер приезжает на объект для проведения замеров, оценки сложности работ и подбора оптимального оборудования.',
                    icon: Icons.message_outlined,
                    color: Colors.green,
                  ),
                  _ProcessStep(
                    number: 3,
                    title: 'Составление сметы и договора',
                    description:
                        'На основе замеров мы составляем подробную смету и заключаем договор с фиксированной ценой без скрытых платежей.',
                    icon: Icons.description,
                    color: Colors.orange,
                  ),
                  _ProcessStep(
                    number: 4,
                    title: 'Доставка оборудования',
                    description:
                        'Мы доставляем все необходимое оборудование и материалы на объект в согласованные сроки.',
                    icon: Icons.local_shipping,
                    color: Colors.purple,
                  ),
                  _ProcessStep(
                    number: 5,
                    title: 'Профессиональный монтаж',
                    description:
                        'Наша команда выполняет монтажные работы в строгом соответствии с техническими стандартами и вашими пожеланиями.',
                    icon: Icons.engineering,
                    color: Colors.red,
                  ),
                  _ProcessStep(
                    number: 6,
                    title: 'Пуско-наладка и инструктаж',
                    description:
                        'После монтажа мы проводим пуско-наладку системы, тестируем все функции и обучаем вас правильной эксплуатации.',
                    icon: Icons.school,
                    color: Colors.teal,
                  ),
                  _ProcessStep(
                    number: 7,
                    title: 'Гарантийное обслуживание',
                    description:
                        'Предоставляем гарантию 2 года на все работы и оборудование. Осуществляем сервисное обслуживание по вашему запросу.',
                    icon: Icons.verified,
                    color: Colors.indigo,
                  ),
                ],
              ),
            ),

            // Why Choose Us
            Section(
              title: 'Почему выбирают нас',
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isDesktop ? 3 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final benefits = [
                    {
                      'icon': Icons.attach_money,
                      'title': 'Доступные цены',
                      'description':
                          'Прозрачное ценообразование без скрытых платежей',
                    },
                    {
                      'icon': Icons.schedule,
                      'title': 'Соблюдение сроков',
                      'description':
                          'Строгое соблюдение оговоренных сроков выполнения работ',
                    },
                    {
                      'icon': Icons.engineering,
                      'title': 'Опытные мастера',
                      'description':
                          'Квалифицированные специалисты с опытом от 5 лет',
                    },
                    {
                      'icon': Icons.security,
                      'title': 'Гарантия 2 года',
                      'description':
                          'Длительная гарантия на все виды работ и оборудование',
                    },
                    {
                      'icon': Icons.cleaning_services,
                      'title': 'Чистота после работ',
                      'description':
                          'Убираем за собой и оставляем идеальную чистоту',
                    },
                    {
                      'icon': Icons.support_agent,
                      'title': 'Круглосуточная поддержка',
                      'description':
                          'Техническая поддержка 24/7 после завершения работ',
                    },
                  ];
                  final benefit = benefits[index];
                  return _BenefitCard(benefit: benefit);
                },
              ),
            ),

            // FAQ
            Section(
              title: 'Частые вопросы',
              child: ContentCard(
                child: Column(
                  children: [
                    _FAQItem(
                      question:
                          'Сколько времени занимает установка кондиционера?',
                      answer:
                          'Стандартный монтаж занимает 3-4 часа. Сложные работы (длинные трассы, дополнительные работы) могут занять до 8 часов.',
                    ),
                    _FAQItem(
                      question:
                          'Нужно ли присутствие заказчика во время работ?',
                      answer:
                          'Присутствие необходимо только при приемке работы и получении инструктажа. В остальное время вы можете заниматься своими делами.',
                    ),
                    _FAQItem(
                      question: 'Предоставляете ли вы оборудование?',
                      answer:
                          'Да, мы можем поставить оборудование от проверенных производителей с гарантией. Также работаем с вашим оборудованием.',
                    ),
                    _FAQItem(
                      question: 'Какой срок гарантии на работы?',
                      answer:
                          'Мы предоставляем гарантию 2 года на все монтажные работы и 1 год на дополнительное оборудование.',
                    ),
                    _FAQItem(
                      question: 'Работаете ли вы в выходные дни?',
                      answer:
                          'Да, мы работаем 7 дней в неделю. Можем выполнить монтаж в удобное для вас время, включая выходные и праздничные дни.',
                    ),
                  ],
                ),
              ),
            ),

            // CTA
            ContentCard(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              child: Column(
                children: [
                  Text(
                    'Готовы начать сотрудничество?',
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Оставьте заявку и наш специалист свяжется с вами в течение 15 минут',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  GradientButton(
                    text: 'Оставить заявку',
                    onPressed: () => GoRouter.of(context).go('/contacts'),
                    fullWidth: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _ProcessStep extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const _ProcessStep({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop) ...[
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color, color.withOpacity(0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.white, size: 24),
                  const SizedBox(height: 4),
                  Text(
                    number.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
          ],
          Expanded(
            child: ContentCard(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isDesktop) ...[
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [color, color.withOpacity(0.8)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(icon, color: Colors.white, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Шаг $number',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: color,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                  if (isDesktop)
                    Text(
                      'Шаг $number: $title',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  else
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.7),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BenefitCard extends StatelessWidget {
  final Map<String, dynamic> benefit;

  const _BenefitCard({required this.benefit});

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  Theme.of(context).colorScheme.primary.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              benefit['icon'] as IconData,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            benefit['title'] as String,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            benefit['description'] as String,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class _FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const _FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.surface.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            answer,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Gallery Page ----------
class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  int _selectedCategory = 0;
  final List<String> _categories = [
    'Все работы',
    'Установка',
    'Обслуживание',
    'Ремонт',
    'Коммерческие объекты',
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : 20,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Галерея работ',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Реализованные проекты и примеры наших работ в Нижнем Новгороде',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onBackground.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 40),

            // Category Filter
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) => FilterChip(
                  label: Text(_categories[index]),
                  selected: _selectedCategory == index,
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = index;
                    });
                  },
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  selectedColor: Theme.of(context).colorScheme.primary,
                  labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _selectedCategory == index
                        ? Colors.white
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Gallery Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isDesktop
                    ? 3
                    : isTablet
                    ? 2
                    : 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: sampleImages.length,
              itemBuilder: (context, index) =>
                  _GalleryItem(imageUrl: sampleImages[index], index: index),
            ),

            const SizedBox(height: 40),

            // Statistics
            ContentCard(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              child: Column(
                children: [
                  Text(
                    'Наша статистика',
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isDesktop
                          ? 4
                          : isTablet
                          ? 2
                          : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final stats = [
                        {'number': '2000+', 'label': 'Выполненных проектов'},
                        {'number': '15+', 'label': 'Лет опыта работы'},
                        {'number': '98%', 'label': 'Довольных клиентов'},
                        {'number': '24/7', 'label': 'Поддержка'},
                      ];
                      final stat = stats[index];
                      return _StatCard(stat: stat);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // CTA
            ContentCard(
              child: Column(
                children: [
                  Text(
                    'Хотите такой же результат?',
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Оставьте заявку и мы реализуем ваш проект с таким же качеством',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  GradientButton(
                    text: 'Обсудить проект',
                    onPressed: () => GoRouter.of(context).go('/contacts'),
                    fullWidth: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GalleryItem extends StatelessWidget {
  final String imageUrl;
  final int index;

  const _GalleryItem({required this.imageUrl, required this.index});

  @override
  Widget build(BuildContext context) {
    final descriptions = [
      'Установка сплит-системы в квартире',
      'Монтаж кондиционера в офисе',
      'Обслуживание системы в торговом центре',
      'Ремонт промышленного кондиционера',
      'Установка мульти-сплит системы',
      'Профилактика системы кондиционирования',
    ];

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                InteractiveViewer(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Проект ${index + 1}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    descriptions[index],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final Map<String, dynamic> stat;

  const _StatCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.surface.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            stat['number'] as String,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            stat['label'] as String,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ---------- Contacts Page ----------
class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  String _selectedService = 'Установка кондиционера';

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : 20,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Контакты', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 8),
            Text(
              'Свяжитесь с нами для консультации или оформления заказа',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onBackground.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 40),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isDesktop) ...[
                  Expanded(flex: 2, child: _ContactInfoSection()),
                  const SizedBox(width: 60),
                  Expanded(
                    flex: 3,
                    child: _ContactFormSection(formKey: _formKey),
                  ),
                ] else
                  Column(
                    children: [
                      _ContactInfoSection(),
                      const SizedBox(height: 40),
                      _ContactFormSection(formKey: _formKey),
                    ],
                  ),
              ],
            ),

            const SizedBox(height: 60),

            // Map Section
            Section(
              title: 'Мы на карте',
              subtitle: 'Наш офис в Нижнем Новгороде',
              child: ContentCard(
                padding: EdgeInsets.zero,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Stack(
                    children: [
                      // Placeholder for map
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.map,
                              size: 64,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.3),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Карта Нижнего Новгорода',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface.withOpacity(0.5),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: ContentCard(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.red),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'г. Нижний Новгород, ул. Советская, 12',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Ежедневно с 8:00 до 22:00',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withOpacity(0.6),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _ContactInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Контактная информация',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 24),

        _ContactInfoItem(
          icon: Icons.phone,
          title: 'Телефон',
          value: '+7 (999) 123-45-67',
          onTap: () {}, // Здесь можно добавить функционал звонка
        ),
        _ContactInfoItem(
          icon: Icons.email,
          title: 'Email',
          value: 'info@skidanov-service.ru',
          onTap: () {}, // Здесь можно добавить функционал отправки email
        ),
        _ContactInfoItem(
          icon: Icons.location_on,
          title: 'Адрес',
          value: 'г. Нижний Новгород, ул. Советская, 12',
          onTap: () {}, // Здесь можно добавить открытие карты
        ),
        _ContactInfoItem(
          icon: Icons.schedule,
          title: 'Режим работы',
          value: 'Ежедневно с 8:00 до 22:00',
        ),

        const SizedBox(height: 32),

        ContentCard(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Срочный вызов',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'При необходимости срочного ремонта или консультации, звоните нам в любое время',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              GradientButton(
                text: 'Позвонить сейчас',
                onPressed: () {}, // Функционал звонка
                fullWidth: true,
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        ContentCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Социальные сети',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _SocialButton(
                    icon: Icons.telegram,
                    onPressed: () {}, // Ссылка на Telegram
                  ),
                  const SizedBox(width: 12),
                  _SocialButton(
                    icon: Icons.message_sharp,
                    onPressed: () {}, // Ссылка на WhatsApp
                  ),
                  const SizedBox(width: 12),
                  _SocialButton(
                    icon: Icons.video_call,
                    onPressed: () {}, // Ссылка на VK
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  const _ContactInfoItem({
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        Theme.of(context).colorScheme.primary.withOpacity(0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        value,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}

class _ContactFormSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const _ContactFormSection({required this.formKey});

  @override
  State<_ContactFormSection> createState() => _ContactFormSectionState();
}

class _ContactFormSectionState extends State<_ContactFormSection> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  String _selectedService = 'Установка кондиционера';

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Оставить заявку',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Заполните форму и мы свяжемся с вами в течение 15 минут',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 24),

          Form(
            key: widget.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Ваше имя',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите ваше имя';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Телефон',
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите ваш телефон';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email (необязательно)',
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedService,
                  decoration: const InputDecoration(
                    labelText: 'Услуга',
                    prefixIcon: Icon(Icons.construction),
                  ),
                  items:
                      [
                        'Установка кондиционера',
                        'Обслуживание',
                        'Ремонт',
                        'Заправка фреоном',
                        'Демонтаж',
                        'Консультация',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedService = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    labelText: 'Сообщение (необязательно)',
                    prefixIcon: Icon(Icons.message),
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 24),
                GradientButton(
                  text: 'Отправить заявку',
                  onPressed: () {
                    if (widget.formKey.currentState!.validate()) {
                      // Обработка отправки формы
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Заявка отправлена! Мы свяжемся с вами в ближайшее время.',
                          ),
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                        ),
                      );
                    }
                  },
                  fullWidth: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

