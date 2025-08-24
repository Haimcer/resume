import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChipTag extends StatelessWidget {
  final String text;
  const ChipTag(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F25),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2A2F37)),
      ),
      child: Text(text, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
    );
  }
}