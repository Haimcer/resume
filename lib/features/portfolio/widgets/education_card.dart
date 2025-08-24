import 'package:flutter/material.dart';
import '../../../data/profile_data.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/title_text.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText('Education'),
            const SizedBox(height: 10),
            ...data.education.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title, style: subhead(context)),
                            Text(e.place, style: muted(context)),
                          ],
                        ),
                      ),
                      Text(e.period, style: muted(context)),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}