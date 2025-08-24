import 'package:flutter/material.dart';
import '../core/models/profile.dart';

const data = ProfileData(
  name: 'Allan Ribeiro',
  headline: 'Flutter Developer',
  about:
      'I am a mobile developer specialized in Flutter, passionate about turning ideas into scalable apps with Firebase, REST integrations, authentication, push notifications, geolocation, and cloud storage. I have published apps on Google Play and the App Store, including social platforms with check-in features, administrative dashboards, business apps, and an eBook reader with offline downloads.',
  interests: ['Flutter', 'APIs', 'Firebase', 'UI/UX', 'Games', 'Cloud'],
  experiences: [
    Experience(
      company: 'Smart Pública',
      role: 'Flutter Developer (Contractor)',
      period: 'Multi-year — Present',
      bullets: [
        'Built and maintained cross-platform mobile apps for internal and public users.',
        'Authentication, role-based access, geolocation, and push notifications using Firebase.',
        'Modular architecture with MobX/Provider and clean code standards.',
      ],
      tools: [
        'Flutter',
        'Dart',
        'Firebase',
        'MobX',
        'Provider',
        'REST',
        'AWS S3'
      ],
    ),
    Experience(
      company: 'Techinnovate Labs',
      role: 'Flutter Developer (Contractor)',
      period: 'Multi-year — Present',
      bullets: [
        'Delivered consumer apps end-to-end (e.g., My Cooking, Black Stories — PT/EN).',
        'Offline-first features with local storage, media handling, and performance tuning.',
        'Releases to Google Play and App Store with monitoring/updates.',
      ],
      tools: ['Flutter', 'Dart', 'Firebase', 'SQLite', 'REST'],
    ),
    Experience(
      company: 'Freelance Projects',
      role: 'Flutter & Dart Developer (Freelancer)',
      period: 'Ongoing — Present',
      bullets: [
        'Scoped, designed, and shipped apps for SMEs and startups from brief to release.',
        'Built supporting services with JavaScript/Node.js (REST APIs, webhook handlers).',
        'App Store / Play Store submission, analytics, and iterative improvements.',
      ],
      tools: ['Flutter', 'Dart', 'JavaScript', 'Node.js', 'Firebase', 'AWS S3'],
    ),
  ],
  skills: Skills(
    tech: [
      'Flutter',
      'Dart',
      'MobX',
      'Provider',
      'Firebase',
      'REST',
      'GraphQL',
      'SQLite',
      'Node.js',
      'PostgreSQL',
      'AWS S3'
    ],
    toolstack: [
      'Git',
      'Postman',
      'Figma',
      'VS Code',
      'Android Studio',
      'XCode'
    ],
  ),
  education: [
    Education(title: 'Self-taught + Bootcamps', place: 'Brasil', period: '—'),
    Education(
        title: 'Flutter Bootcamps (Udemy / Angela Yu / Maximilian)',
        place: 'Online',
        period: '—'),
  ],
  links: [
    QuickLink(
      'My Cooking (Android)',
      'https://play.google.com/store/apps/details?id=com.tbsapps.mycooking&hl=pt_BR',
      icon: Icons.android,
    ),
    QuickLink(
      'My Cooking AirFryer (Android)',
      'https://play.google.com/store/apps/details?id=com.techinnovatelabs.mycookingairfryer&hl=pt_BR',
      icon: Icons.android,
    ),
    QuickLink(
      'Black Stories (PT-BR) (Android)',
      'https://play.google.com/store/apps/details?id=com.techinnovatelabs.black_stories_ptbr&hl=pt_BR',
      icon: Icons.android,
    ),
    QuickLink(
      'Black Stories Premium (EN-US) (Android)',
      'https://play.google.com/store/apps/details?id=com.techinnovatelabs.black_stories_premium_enus&hl=pt_BR',
      icon: Icons.android,
    ),
    QuickLink(
      'Black Stories Premium (PT-BR) (Android)',
      'https://play.google.com/store/apps/details?id=com.techinnovatelabs.black_stories_premium_ptbr&hl=pt_BR',
      icon: Icons.android,
    ),
    QuickLink(
      'Black Stories (EN-US) (Android)',
      'https://play.google.com/store/apps/details?id=com.techinnovatelabs.black_stories_enus&hl=pt_BR',
      icon: Icons.android,
    ),
    QuickLink(
      'Flirt Jae (Android)',
      'https://play.google.com/store/apps/details?id=com.app.jae&hl=pt_BR',
      icon: Icons.android,
    ),
    QuickLink(
      'Quero Munck (Android)',
      'https://play.google.com/store/apps/details?id=com.app.queromunck',
      icon: Icons.android,
    ),
    QuickLink(
      'Flirt Jae (iOS)',
      'https://apps.apple.com/br/app/appjae/id6741868124',
      icon: Icons.apple,
    ),
    QuickLink(
      'Quero Munck (iOS)',
      'https://apps.apple.com/us/app/quero-munck/id6742332928',
      icon: Icons.apple,
    ),
    QuickLink('GitHub', 'https://github.com/Haimcer', icon: Icons.code),
    QuickLink('LinkedIn', 'https://www.linkedin.com/in/allan-ribeiro-silva-46596134a/', icon: Icons.business),
  ],
  languages: ['English (B2 — Upper-Intermediate)', 'Portuguese (Native)'],
  details: [
    Detail(Icons.location_on_rounded, 'São Paulo • Remote OK'),
    Detail(Icons.mail_rounded, 'allan1995.ars@gmail.com'),
    Detail(Icons.phone, '+55 (12) 9 8808-6189'),
  ],
);