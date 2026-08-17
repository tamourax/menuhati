import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextAlign textAlign;

  const TextTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 342,
          height: 40,
          child: Text(
            title,
            textAlign: textAlign,
            style: GoogleFonts.playfairDisplay(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 40 / 32,
            ),
          ),
        ),

        const SizedBox(height: 8),

        SizedBox(
          width: 342,
          height: 24,
          child: Text(
            subTitle,
            textAlign: textAlign,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF605E5C),
              height: 24 / 16,
            ),
          ),
        ),
      ],
    );
  }
}