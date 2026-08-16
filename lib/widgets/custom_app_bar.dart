import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppHeader extends StatelessWidget {
  final bool showBackButton;
  final bool showCartIcon;
  final String title;

  const AppHeader({
    super.key,
    this.showBackButton = false,
    this.showCartIcon = false,
    this.title = 'Menuhati',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: const Color(0xfff5f6f7),
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          else
            const SizedBox(width: 48),

          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Playfair Display',
                  color: Colors.black,
                ),
              ),
            ),
          ),

          if (showCartIcon)
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.bagShopping,
                size: 24,
                color: Colors.black,
              ),
              onPressed: () {
                print('Cart clicked');
              },
            )
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }
}