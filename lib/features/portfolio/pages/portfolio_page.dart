import 'package:flutter/material.dart';
import '../../../core/models/profile.dart';
import '../../../data/profile_data.dart';
import '../../../shared/widgets/app_card.dart';
import '../widgets/header_card.dart';
import '../widgets/interests_row.dart';
import '../widgets/experience_card.dart';
import '../widgets/skills_card.dart';
import '../widgets/education_card.dart';
import '../widgets/languages_card.dart';
import '../widgets/links_card.dart';
import '../widgets/details_card.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1000;
    final content = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1160),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderCard(profile: data, isDesktop: isDesktop),
            const SizedBox(height: 16),
            InterestsRow(items: data.interests, profile: data),
            const SizedBox(height: 24),
            _GridTwoColumns(
              left: Column(
                children: const [
                  ExperienceCard(),
                  SizedBox(height: 16),
                  SkillsCard(),
                ],
              ),
              right: Column(
                children: const [
                  EducationCard(),
                  SizedBox(height: 16),
                  LanguagesCard(),
                  SizedBox(height: 16),
                  LinksCard(),
                  SizedBox(height: 16),
                  DetailsCard(),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                '© ${DateTime.now().year} ${data.name} — Built with Flutter',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white60),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Center(child: SingleChildScrollView(child: content)),
    );
  }
}

class _GridTwoColumns extends StatelessWidget {
  final Widget left;
  final Widget right;
  const _GridTwoColumns({required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1000;
    if (!isDesktop) {
      return Column(children: [left, const SizedBox(height: 16), right]);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: left),
        const SizedBox(width: 16),
        Expanded(child: right),
      ],
    );
  }
}