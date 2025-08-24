import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/theme/app_theme.dart';
import 'features/portfolio/pages/portfolio_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allan Ribeiro — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(GoogleFonts.interTextTheme(ThemeData.dark().textTheme)),
      home: const PortfolioPage(),
    );
  }
}