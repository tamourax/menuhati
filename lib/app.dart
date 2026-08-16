import 'package:flutter/material.dart';
import 'package:menuhati/screens/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Hati',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F5F2),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
