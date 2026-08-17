import 'package:flutter/material.dart';

import '../widgets/text_tile.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/coffe_item_card_listview.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(showBackButton: false, showCartIcon: true, title: 'Menu'),
          TextTile(),
          Expanded(child: CoffeeItemCardListView()),
        ],
      ),
    );
  }
}
