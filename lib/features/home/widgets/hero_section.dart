import 'package:flutter/material.dart';
import 'package:aircool/config/app_config.dart';
import 'package:aircool/features/home/widgets/hero_content.dart';
import 'package:aircool/features/home/widgets/hero_visual.dart';

/// Hero секция главной страницы
class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.of(context).size.width >= AppConfig.desktopBreakpoint;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.tertiary,
            Theme.of(context).colorScheme.primaryContainer,
          ],
          stops: const [0.0, 0.3, 0.7, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
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
                        Expanded(child: HeroContent()),
                        const SizedBox(width: 60),
                        SizedBox(width: 500, child: HeroVisual()),
                      ],
                    )
                  else
                    Column(
                      children: [
                        HeroContent(),
                        const SizedBox(height: 40),
                        HeroVisual(),
                      ],
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
