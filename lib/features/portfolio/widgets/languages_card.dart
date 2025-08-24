import 'package:flutter/material.dart';
import '../../../data/profile_data.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/title_text.dart';
import '../../../shared/widgets/chip_tag.dart';

class LanguagesCard extends StatelessWidget {
  const LanguagesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText('Languages'),
            const SizedBox(height: 8),
            Wrap(spacing: 8, runSpacing: 8, children: data.languages.map((e) => ChipTag(e)).toList()),
          ],
        ),
      ),
    );
  }
}