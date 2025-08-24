import 'package:flutter/material.dart';
import '../../../data/profile_data.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/title_text.dart';
import '../../../shared/widgets/chip_tag.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText('Stack'),
            const SizedBox(height: 12),
            Text('Tech', style: subhead(context)),
            const SizedBox(height: 8),
            Wrap(spacing: 8, runSpacing: 8, children: data.skills.tech.map((e) => ChipTag(e)).toList()),
            const SizedBox(height: 16),
            Text('Tools', style: subhead(context)),
            const SizedBox(height: 8),
            Wrap(spacing: 8, runSpacing: 8, children: data.skills.toolstack.map((e) => ChipTag(e)).toList()),
          ],
        ),
      ),
    );
  }
}