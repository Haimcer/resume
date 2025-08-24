import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const AppCard({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xFF16181D),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
              color: Colors.black54,
              blurRadius: 24,
              spreadRadius: -12,
              offset: Offset(0, 12)),
        ],
        border: Border.all(color: const Color(0xFF23262F), width: 1),
      ),
      child: child,
    );
  }
}