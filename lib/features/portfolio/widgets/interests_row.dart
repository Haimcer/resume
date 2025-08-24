import 'package:flutter/material.dart';
import '../../../core/models/profile.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/chip_tag.dart';
import '../../../platform/resume_downloader.dart';

class InterestsRow extends StatelessWidget {
  final List<String> items;
  final ProfileData profile;
  const InterestsRow({super.key, required this.items, required this.profile});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(spacing: 10, runSpacing: 10, children: items.map((t) => ChipTag(t)).toList()),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: () => downloadResume(profile),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1C1F25),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.download, size: 18),
              label: const Text('Download Résumé (HTML)'),
            ),
          ),
        ],
      ),
    );
  }
}