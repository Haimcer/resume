import 'package:flutter/material.dart';
import '../../../data/profile_data.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/title_text.dart';
import '../../../shared/widgets/chip_tag.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText('Experience'),
            const SizedBox(height: 12),
            ...data.experiences.expand((e) => [
                  _ExpTile(company: e.company, role: e.role, period: e.period, bullets: e.bullets, tools: e.tools),
                  const SizedBox(height: 14),
                ]),
          ],
        ),
      ),
    );
  }
}

class _ExpTile extends StatelessWidget {
  final String company;
  final String role;
  final String period;
  final List<String> bullets;
  final List<String> tools;
  const _ExpTile({required this.company, required this.role, required this.period, required this.bullets, required this.tools});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D23),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF2A2F37)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(company, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800)),
              ),
              Text(period, style: muted(context)),
            ],
          ),
          const SizedBox(height: 8),
          Text(role, style: muted(context)),
          const SizedBox(height: 12),
          ...bullets.map((b) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [const Text('•  '), Expanded(child: Text(b))],
                ),
              )),
          const SizedBox(height: 8),
          Wrap(spacing: 8, runSpacing: 8, children: tools.map((e) => ChipTag(e)).toList()),
        ],
      ),
    );
  }
}