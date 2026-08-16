import 'dart:ui';

class CoffeeCardModel {
  final String title;
  final String distance;
  final String imagePath;
  final VoidCallback? onTap;

  const CoffeeCardModel({
    required this.title,
    required this.distance,
    required this.imagePath,
    this.onTap,
  });
}
