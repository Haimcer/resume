import 'package:flutter/material.dart';
import '../../../data/profile_data.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/title_text.dart';
import '../../../services/apple_artwork_icon.dart';
import '../../../services/launcher.dart';

class LinksCard extends StatelessWidget {
  const LinksCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText('Portfolio'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: data.links.map((l) => AppLinkButton(label: l.label, url: l.url, icon: l.icon, imageUrl: l.imageUrl)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppLinkButton extends StatelessWidget {
  final String label;
  final String url;
  final IconData? icon;
  final String? imageUrl;
  const AppLinkButton({super.key, required this.label, required this.url, this.icon, this.imageUrl});

  bool get _isApple => url.contains('apps.apple.com');
  bool get _isPlay => url.contains('play.google.com');

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF1C1F25),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );

    Widget leading;
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      leading = ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(imageUrl!, width: 22, height: 22, fit: BoxFit.cover),
      );
    } else if (_isApple) {
      leading = AppleArtworkIcon(appStoreUrl: url);
    } else if (_isPlay) {
      leading = const Icon(Icons.android, size: 18);
    } else {
      leading = Icon(icon ?? Icons.link, size: 18);
    }

    return ElevatedButton.icon(
      onPressed: () => launchExternal(url),
      style: buttonStyle,
      icon: leading,
      label: Text(label),
    );
  }
}