import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aircool/core/routing/app_routes.dart';

/// Элемент предпросмотра галереи
class GalleryPreviewItem extends StatelessWidget {
  final String imageUrl;

  const GalleryPreviewItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).go(AppRoutes.gallery),
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
