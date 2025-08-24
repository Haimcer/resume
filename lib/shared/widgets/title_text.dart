import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w800),
    );
  }
}

TextStyle subhead(BuildContext context) =>
    Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700);

TextStyle muted(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white70);