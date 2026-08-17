import 'package:flutter/material.dart';
import 'package:menuhati/widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/text_tile.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F4),
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
                title: 'Menuhati',
              ),

            SizedBox(
                  width: double.infinity,
                  height: 72,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 110,
                        top: 40,
                        child: Icon(
                          Icons.favorite,
                          size: 20,
                          color: const Color(0xffA99585),
                        ),
                      ),
                      Positioned(
                        right: 120,
                        top: 50,
                        child: Icon(
                          Icons.chevron_left,
                          size: 28,
                          color: const Color(0xffA7A3A0),
                        ),
                      ),
                      ],
                  ),
                ),
                      
            // Page Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      // Success Icon
                      SizedBox(
                        width: 342,
                        height: 280,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 192,
                              height: 192,
                              decoration: BoxDecoration(
                                color: const Color(0xffF3F3F4),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xffE2E2E2),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xff33231D,
                                    ).withValues(alpha: 0.10),
                                    blurRadius: 40,
                                    spreadRadius: -15,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.local_cafe,
                                size: 60,
                                color: Color(0xff33231D),
                              ),
                            ),

                            // Check Badge
                            Positioned(
                              right: 75,
                              bottom: 35,
                              child: Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: const Color(0xff5C3206),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xffF9F9F9),
                                    width: 4,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.10),
                                      blurRadius: 15,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 29,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 4),

                      // Text
                      const TextTile(
                        title: 'Order placed!',
                        subTitle: 'Your drink is being prepared ☕',
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 48),

                      // Buttons
                      const CustomButton(),

                      const SizedBox(height: 24),
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