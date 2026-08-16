import 'package:flutter/material.dart';
import 'coffe_item_card.dart';

class CoffeeItemCardListView extends StatelessWidget {
  const CoffeeItemCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    final coffeeItems = [
      {
        'image': 'assets/png/iced_spanish_latte.jpg',
        'name': 'Iced Spanish Latte',
        'description':
            'A rich blend of espresso, cold milk, and sweetened',
        'price': '\$5.50',
      },
      {
        'image': 'assets/png/iced_spanish_latte.jpg',
        'name': 'Cappuccino',
        'description':
            'Espresso with steamed milk and a creamy milk foam',
        'price': '\$4.50',
      },
      {
        'image': 'assets/png/iced_spanish_latte.jpg',
        'name': 'Caramel Macchiato',
        'description':
            'Espresso with caramel, milk, and a smooth creamy taste',
        'price': '\$5.00',
      },
    ];

    return ListView.builder(
      itemCount: coffeeItems.length,
      itemBuilder: (context, index) {
        final coffee = coffeeItems[index];

        return CoffeeItemCard(
          image: coffee['image']!,
          name: coffee['name']!,
          description: coffee['description']!,
          price: coffee['price']!,
        );
      },
    );
  }
}