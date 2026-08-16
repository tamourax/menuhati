import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F2),
      appBar: AppBar(
        title: const Text(
          'Menu Hati Café',
          style: TextStyle(
            color: Color(0xFF33231C),
            fontWeight: FontWeight.bold,
            fontFamily: 'serif',
          ),
        ),
        backgroundColor: const Color(0xFFF7F5F2),
        elevation: 0,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Welcome to Menu Hati!',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF33231C),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
