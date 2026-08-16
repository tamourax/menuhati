import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool center;

  const TextTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.center = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment:
            center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: center ? TextAlign.center : TextAlign.start,
            style: GoogleFonts.playfairDisplay(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 40 / 32,
              color: const Color(0xff33231D),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            subtitle,
            textAlign: center ? TextAlign.center : TextAlign.start,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: const Color(0xff605E5C),
              height: 28 / 18,
            ),
          ),
        ],
      ),
    );
  }
}