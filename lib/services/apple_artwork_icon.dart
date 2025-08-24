import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppleArtworkIcon extends StatefulWidget {
  final String appStoreUrl;
  const AppleArtworkIcon({super.key, required this.appStoreUrl});

  @override
  State<AppleArtworkIcon> createState() => _AppleArtworkIconState();
}

class _AppleArtworkIconState extends State<AppleArtworkIcon> {
  String? _artwork;

  @override
  void initState() {
    super.initState();
    _fetchArtwork();
  }

  Future<void> _fetchArtwork() async {
    try {
      final idMatch = RegExp(r'id(\d+)').firstMatch(widget.appStoreUrl);
      if (idMatch == null) return;
      final appId = idMatch.group(1);
      final url = Uri.parse('https://itunes.apple.com/lookup?id=$appId');
      final res = await http.get(url);
      if (res.statusCode == 200) {
        final jsonMap = jsonDecode(res.body) as Map<String, dynamic>;
        if ((jsonMap['resultCount'] ?? 0) > 0) {
          final art = (jsonMap['results'] as List).first['artworkUrl100'] as String;
          setState(() => _artwork = art.replaceAll('100x100bb', '200x200bb'));
        }
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    if (_artwork == null) return const Icon(Icons.apple, size: 18);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(_artwork!, width: 22, height: 22, fit: BoxFit.cover),
    );
  }
}