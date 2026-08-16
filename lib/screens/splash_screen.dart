import 'dart:async';

import 'package:flutter/material.dart';
import 'package:menuhati/screens/home_screen.dart';
import 'package:menuhati/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF3F3F4);
    const logoColor = Color(0xFF4B3832);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: const Color(0xFFEEEEEE),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.10),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: -1,
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.10),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: -2,
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.local_cafe,
                  size: 40,
                  color: logoColor,
                ),
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              'Menuhati',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                height: 1.2,
                fontWeight: FontWeight.bold,
                fontFamily: 'Playfair Display',
                letterSpacing: -0.8,
                color: logoColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}