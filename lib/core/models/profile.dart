import 'package:flutter/material.dart';

class ProfileData {
  final String name;
  final String headline;
  final String about;
  final List<String> interests;
  final List<Experience> experiences;
  final Skills skills;
  final List<Education> education;
  final List<QuickLink> links;
  final List<String> languages;
  final List<Detail> details;

  const ProfileData({
    required this.name,
    required this.headline,
    required this.about,
    required this.interests,
    required this.experiences,
    required this.skills,
    required this.education,
    required this.links,
    required this.languages,
    required this.details,
  });
}

class Experience {
  final String company;
  final String role;
  final String period;
  final List<String> bullets;
  final List<String> tools;
  const Experience({
    required this.company,
    required this.role,
    required this.period,
    required this.bullets,
    required this.tools,
  });
}

class Skills {
  final List<String> tech;
  final List<String> toolstack;
  const Skills({required this.tech, required this.toolstack});
}

class Education {
  final String title;
  final String place;
  final String period;
  const Education({required this.title, required this.place, required this.period});
}

class QuickLink {
  final String label;
  final String url;
  final IconData? icon; // fallback icon (Android/Apple/...)
  final String? imageUrl; // optional app artwork
  const QuickLink(this.label, this.url, {this.icon, this.imageUrl});
}

class Detail {
  final IconData icon;
  final String text;
  const Detail(this.icon, this.text);
}