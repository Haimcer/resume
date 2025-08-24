import 'package:flutter/material.dart';
import '../../../core/models/profile.dart';
import '../../../shared/widgets/app_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderCard extends StatelessWidget {
  final ProfileData profile;
  final bool isDesktop;
  const HeaderCard({super.key, required this.profile, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: isDesktop ? 96 : 72,
            height: isDesktop ? 96 : 72,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF23262F), Color(0xFF1A1C22)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                profile.name.characters.first.toUpperCase(),
                style: GoogleFonts.inter(
                  fontSize: isDesktop ? 44 : 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My name is ${profile.name} — ${profile.headline}",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 12),
                Text(
                  profile.about,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white70, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}