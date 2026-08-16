import 'package:flutter/material.dart';
import 'package:menuhati/widgets/custom_app_bar.dart';
import 'package:menuhati/widgets/upper_photo.dart';
import 'package:menuhati/widgets/text_tile.dart';
import 'package:menuhati/widgets/coffe-category.dart';

class CoffeeDetailsPage extends StatelessWidget {
  final String cafeName;
  final String cafedistance;

  const CoffeeDetailsPage({
    super.key,
    this.cafeName = '',
    this.cafedistance = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F7),
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
              showBackButton: true,
              showCartIcon: true,
              title: cafeName,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OakCoffeeHero(
                        shopName: cafeName,
                        subtitle:
                            'Artisanal Roasts & Organic Bakes',
                        rating: '4.9',
                        reviewCount: '1.2k',
                        distance: cafedistance,
                      ),

                      const SizedBox(height: 48),

                      const TextTile(
                        title: 'What are you craving?',
                        subTitle:
                            'Select a category to explore our crafted menu.',
                      ),

                      const SizedBox(height: 32),

                      const CategoryCard(
                        image: 'assets/png/coffe.jpg',
                        title: 'Hot Coffee',
                        subtitle:
                            'Espresso, Lattes & Classic Roasts',
                        height: 342,
                        width: 342,
                      ),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            child: CategoryCard(
                              image:
                                  'assets/png/iced_spanish_latte.jpg',
                              title: 'Iced Coffee',
                              height: 163,
                              width: 163,
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: CategoryCard(
                              image: 'assets/png/coffe.jpg',
                              title: 'Frappes',
                              height: 163,
                              width: 163,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      const CategoryCard(
                        image: 'assets/png/coffe.jpg',
                        title: 'Tea',
                        height: 163,
                        width: 163,
                      ),

                      const SizedBox(height: 16),

                      const CategoryCard(
                        image: 'assets/png/coffe.jpg',
                        title: 'Desserts',
                        height: 171,
                        width: 342,
                      ),

                      const SizedBox(height: 16),

                      const CategoryCard(
                        image: 'assets/png/coffe.jpg',
                        title: 'Bakery',
                        height: 171,
                        width: 342,
                      ),

                      const SizedBox(height: 96),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}