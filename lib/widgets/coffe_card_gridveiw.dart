import 'package:flutter/material.dart';
import 'package:menuhati/model/coffe_card_model.dart';
import 'package:menuhati/widgets/coffe_card.dart';

/// Model representing the data for each coffee card in the grid

/// A responsive GridView widget that displays a collection of [CoffeeCard] items.
class CoffeeCardGridView extends StatelessWidget {
  final List<CoffeeCardModel>? items;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final void Function(CoffeeCardModel item)? onItemTap;

  const CoffeeCardGridView({
    super.key,
    this.items,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 16.0,
    this.mainAxisSpacing = 16.0,
    this.childAspectRatio = 0.75,
    this.padding = const EdgeInsets.all(16.0),
    this.physics,
    this.shrinkWrap = false,
    this.onItemTap,
  });

  // Default sample coffee items if none are passed
  static const List<CoffeeCardModel> defaultCoffeeList = [
    CoffeeCardModel(
      title: 'Artisanal Roastery',
      distance: '1.2 km away',
      imagePath:
          'https://images.unsplash.com/photo-1554118811-1e0d58224f24?q=80&w=800&auto=format&fit=crop',
    ),
    CoffeeCardModel(
      title: 'Espresso Lounge',
      distance: '2.5 km away',
      imagePath:
          'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?q=80&w=800&auto=format&fit=crop',
    ),
    CoffeeCardModel(
      title: 'The Coffee Lab',
      distance: '800 m away',
      imagePath:
          'https://images.unsplash.com/photo-1509785307050-d4066910ec1e?q=80&w=800&auto=format&fit=crop',
    ),
    CoffeeCardModel(
      title: 'Brew & Pastry',
      distance: '3.1 km away',
      imagePath:
          'https://images.unsplash.com/photo-1517256064527-09c73fc73e38?q=80&w=800&auto=format&fit=crop',
    ),
    CoffeeCardModel(
      title: 'Vintage Cafe',
      distance: '1.8 km away',
      imagePath:
          'https://images.unsplash.com/photo-1534778191329-7d35368a1f89?q=80&w=800&auto=format&fit=crop',
    ),
    CoffeeCardModel(
      title: 'Morning Roast',
      distance: '4.0 km away',
      imagePath:
          'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?q=80&w=800&auto=format&fit=crop',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final list = items ?? defaultCoffeeList;

    return GridView.builder(
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        final item = list[index];
        return CoffeeCard(
          title: item.title,
          distance: item.distance,
          imagePath: item.imagePath,
          onTap: item.onTap ?? (onItemTap != null ? () => onItemTap!(item) : null),
        );
      },
    );
  }
}
