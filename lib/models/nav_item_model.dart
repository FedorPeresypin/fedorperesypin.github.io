import 'package:flutter/material.dart';

/// Модель навигационного элемента
class NavItemModel {
  final String label;
  final String path;
  final IconData outlineIcon;
  final IconData filledIcon;

  const NavItemModel({
    required this.label,
    required this.path,
    required this.outlineIcon,
    required this.filledIcon,
  });
}
