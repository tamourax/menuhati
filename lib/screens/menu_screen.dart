import 'package:flutter/material.dart';
import '../widgets/text_tile.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/coffe_item_card_listview.dart';

class MenuScreen extends StatelessWidget {
  final String title;

  const MenuScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
              showBackButton: true,
              showCartIcon: true,
              title: 'Menuhati',
            ),

            TextTile(
              title: title,
              subTitle:
                  'Chilled to perfection. Our iced coffee selection is crafted to bring out the delicate notes of our roasted beans, perfect for a warm afternoon.',
            ),

            const Expanded(
              child: CoffeeItemCardListView(),
            ),
          ],
        ),
      ),
    );
  }
}