import 'package:flutter/material.dart';
import 'package:menuhati/screens/categories_screen.dart';
import 'package:menuhati/widgets/coffe_card_gridveiw.dart';
import 'package:menuhati/widgets/custom_app_bar.dart';
import 'package:menuhati/widgets/text_tile.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
              showCartIcon: true,
              title: 'Menuhati',
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextTile(
                      title: 'Find your coffee ☕',
                      subTitle: 'Discover artisanal roasters and local spots.',
                    ),
                    
                    const SizedBox(height: 48),
                    
                    Expanded(
                      child: CoffeeCardGridView(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        padding: const EdgeInsets.only(
                          top: 0,
                          bottom: 16.0,
                          left: 0,
                          right: 0,
                        ),
                        onItemTap: (item) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CoffeeDetailsPage(
                                cafeName: item.title,
                                cafedistance: item.distance,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}