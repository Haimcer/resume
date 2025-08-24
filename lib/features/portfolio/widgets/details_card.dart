import 'package:flutter/material.dart';
import '../../../data/profile_data.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/title_text.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          spacing: 24,
          runSpacing: 16,
          children: data.details.map((d) => Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(d.icon, size: 18, color: Colors.white70),
                const SizedBox(width: 8),
                Text(d.text, style: muted(context)),
              ])).toList(),
        ),
      ),
    );
  }
}