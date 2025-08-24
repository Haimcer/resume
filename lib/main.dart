import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF7C5CFF),
        brightness: Brightness.dark,
        background: const Color(0xFF0B0C10),
      ),
      scaffoldBackgroundColor: const Color(0xFF0B0C10),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      cardTheme: CardTheme(
        color: const Color(0xFF16181D),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: EdgeInsets.zero,
      ),
    );

    return MaterialApp(
      title: 'Allan Ribeiro — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const PortfolioPage(),
    );
  }
}

/// ======== Simple “data layer” to edit your info quickly ========
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
  const Education(
      {required this.title, required this.place, required this.period});
}

class QuickLink {
  final String label;
  final String url;
  final IconData? icon; // ícone fallback (Android/Apple/…)
  final String? imageUrl; // URL da imagem (se tiver)
  const QuickLink(this.label, this.url, {this.icon, this.imageUrl});
}

class Detail {
  final IconData icon;
  final String text;
  const Detail(this.icon, this.text);
}

// ======== Fill with your info (edit here) ========
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
  // Links com fallback de ícone (Android/iOS). Se quiser, preencha imageUrl com o PNG/JPG do app.
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
      icon: Icons.apple, // será substituído pelo artwork se encontrado
    ),
    QuickLink(
      'Quero Munck (iOS)',
      'https://apps.apple.com/us/app/quero-munck/id6742332928',
      icon: Icons.apple, // será substituído pelo artwork se encontrado
    ),
    QuickLink('GitHub', 'https://github.com/Haimcer', icon: Icons.code),
    QuickLink('LinkedIn',
        'https://www.linkedin.com/in/allan-ribeiro-silva-46596134a/',
        icon: Icons.business),
  ],
  languages: ['English (B2)', 'Portuguese (Native)'],
  details: [
    Detail(Icons.location_on_rounded, 'São Paulo • Remoto OK'),
    Detail(Icons.mail_rounded, 'allan1995.ars@gmail.com'),
    Detail(Icons.phone, '+55 (12) 9 8808-6189'),
  ],
);

// ======== UI ========
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
            _HeaderCard(isDesktop: isDesktop),
            const SizedBox(height: 16),
            _InterestsRow(items: data.interests),
            const SizedBox(height: 24),
            _GridTwoColumns(
              left: Column(
                children: [
                  _ExperienceCard(),
                  const SizedBox(height: 16),
                  _SkillsCard(),
                ],
              ),
              right: Column(
                children: [
                  _EducationCard(),
                  const SizedBox(height: 16),
                  _LanguagesCard(),
                  const SizedBox(height: 16),
                  _LinksCard(),
                  const SizedBox(height: 16),
                  _DetailsCard(),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                  '© ${DateTime.now().year} ${data.name} — Built with Flutter',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white60)),
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

class _HeaderCard extends StatelessWidget {
  final bool isDesktop;
  const _HeaderCard({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return _Card(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar with monogram
          Container(
            width: isDesktop ? 96 : 72,
            height: isDesktop ? 96 : 72,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF23262F), Color(0xFF1A1C22)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                data.name.characters.first.toUpperCase(),
                style: GoogleFonts.inter(
                  fontSize: isDesktop ? 44 : 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My name is ${data.name} — ${data.headline}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 12),
                Text(
                  data.about,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white70, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InterestsRow extends StatelessWidget {
  final List<String> items;
  const _InterestsRow({required this.items});

  @override
  Widget build(BuildContext context) {
    return _Card(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: items.map((t) => _Chip(t)).toList(),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: () => _downloadResumeHtml(data),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1C1F25),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.download, size: 18),
              label: const Text('Download Résumé (HTML)'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Title('Experience'),
            const SizedBox(height: 12),
            ...data.experiences.expand((e) => [
                  _ExpTile(exp: e),
                  const SizedBox(height: 14),
                ]),
          ],
        ),
      ),
    );
  }
}

class _SkillsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Title('Stack'),
            const SizedBox(height: 12),
            Text('Tech', style: _subhead(context)),
            const SizedBox(height: 8),
            Wrap(
                spacing: 8,
                runSpacing: 8,
                children: data.skills.tech.map((e) => _Chip(e)).toList()),
            const SizedBox(height: 16),
            Text('Tools', style: _subhead(context)),
            const SizedBox(height: 8),
            Wrap(
                spacing: 8,
                runSpacing: 8,
                children: data.skills.toolstack.map((e) => _Chip(e)).toList()),
          ],
        ),
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Title('Education'),
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
                            Text(e.title, style: _subhead(context)),
                            Text(e.place, style: _muted(context)),
                          ],
                        ),
                      ),
                      Text(e.period, style: _muted(context)),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class _LanguagesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Title('Languages'),
            const SizedBox(height: 8),
            Wrap(
                spacing: 8,
                runSpacing: 8,
                children: data.languages.map((e) => _Chip(e)).toList()),
          ],
        ),
      ),
    );
  }
}

class _LinksCard extends StatelessWidget {
  const _LinksCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Title('Portfolio'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: data.links.map((l) => AppLinkButton(link: l)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppLinkButton extends StatelessWidget {
  final QuickLink link;
  const AppLinkButton({super.key, required this.link});

  bool get _isApple => link.url.contains('apps.apple.com');
  bool get _isPlay => link.url.contains('play.google.com');

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF1C1F25),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );

    Widget leading;
    if (link.imageUrl != null && link.imageUrl!.isNotEmpty) {
      leading = ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(link.imageUrl!,
            width: 22, height: 22, fit: BoxFit.cover),
      );
    } else if (_isApple) {
      // tenta buscar artwork da App Store; se falhar, usa ícone da Apple
      leading = _AppleArtworkIcon(appStoreUrl: link.url);
    } else if (_isPlay) {
      // fallback para Android quando não há imagem
      leading = const Icon(Icons.android, size: 18);
    } else {
      // fallback genérico
      leading = Icon(link.icon ?? Icons.link, size: 18);
    }

    return ElevatedButton.icon(
      onPressed: () => _launch(link.url),
      style: buttonStyle,
      icon: leading,
      label: Text(link.label),
    );
  }
}

/// Busca o ícone (artwork) no iTunes Search API a partir do id no link da App Store.
/// Ex.: https://apps.apple.com/br/app/appjae/id6741868124  -> id=6741868124
class _AppleArtworkIcon extends StatefulWidget {
  final String appStoreUrl;
  const _AppleArtworkIcon({required this.appStoreUrl});

  @override
  State<_AppleArtworkIcon> createState() => _AppleArtworkIconState();
}

class _AppleArtworkIconState extends State<_AppleArtworkIcon> {
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
          final art =
              (jsonMap['results'] as List).first['artworkUrl100'] as String;
          setState(() {
            _artwork = art.replaceAll('100x100bb', '200x200bb');
          });
        }
      }
    } catch (_) {
      // silencioso: se falhar, cai no ícone padrão
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_artwork == null) {
      return const Icon(Icons.apple, size: 18);
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(_artwork!, width: 22, height: 22, fit: BoxFit.cover),
    );
  }
}

String _buildResumeHtml(ProfileData d) {
  String expSection = d.experiences.map((e) => '''
      <div class="exp">
        <div class="exp-header">
          <div class="role">${_esc(e.role)} — <span class="company">${_esc(e.company)}</span></div>
          <div class="period">${_esc(e.period)}</div>
        </div>
        <ul class="bullets">
          ${e.bullets.map((b) => '<li>${_esc(b)}</li>').join()}
        </ul>
        <div class="tools">${e.tools.map((t) => '<span class="chip">${_esc(t)}</span>').join(' ')}</div>
      </div>
  ''').join('\n');

  String linksSection = d.links
      .map((l) => '<li><a href="${_esc(l.url)}">${_esc(l.label)}</a></li>')
      .join('\n');

  String techChips = d.skills.tech
      .map((t) => '<span class="chip">${_esc(t)}</span>')
      .join(' ');
  String toolChips = d.skills.toolstack
      .map((t) => '<span class="chip">${_esc(t)}</span>')
      .join(' ');
  String eduSection = d.education
      .map((e) =>
          '<li><strong>${_esc(e.title)}</strong> — ${_esc(e.place)} <span class="muted">${_esc(e.period)}</span></li>')
      .join('\n');
  String langSection =
      d.languages.map((l) => '<span class="chip">${_esc(l)}</span>').join(' ');
  String details =
      d.details.map((d0) => '<span>${_esc(d0.text)}</span>').join(' • ');

  return '''
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${_esc(d.name)} — Resume</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
  <style>
    :root { --bg:#0b0c10; --card:#16181d; --muted:#8b90a1; --text:#eaeaf0; --chip:#1c1f25; --border:#23262f; --brand:#7c5cff; }
    * { box-sizing: border-box; }
    body { margin:0; background:#0b0c10; font-family: 'Inter', system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial; color: var(--text); }
    .page { max-width: 900px; margin: 32px auto; padding: 24px; }
    .header { display:flex; justify-content:space-between; align-items:flex-start; gap:24px; }
    .name { font-size: 28px; font-weight: 800; }
    .headline { color: var(--muted); margin-top:4px; }
    .contact { text-align:right; color: var(--muted); font-size: 14px; }
    .section { background: var(--card); border:1px solid var(--border); border-radius: 16px; padding:18px 20px; margin-top:16px; }
    .section h2 { margin:0 0 10px; font-size:18px; font-weight:800; }
    .muted { color: var(--muted); }
    .chip { display:inline-block; padding:6px 10px; background: var(--chip); border:1px solid var(--border); border-radius:10px; margin:4px 6px 0 0; font-size: 13px; }
    .exp { padding: 10px 0; border-top:1px dashed var(--border); }
    .exp:first-of-type { border-top: 0; }
    .exp-header { display:flex; justify-content:space-between; gap:12px; }
    .role { font-weight: 700; }
    .company { color: var(--brand); }
    .period { color: var(--muted); white-space: nowrap; }
    ul { margin:6px 0 0 18px; }
    a { color: #c5c8ff; text-decoration: none; }
    a:hover { text-decoration: underline; }
    @media print {
      body { background:#fff; color:#000; }
      .section { border-color:#ddd; }
      a { color:#000; text-decoration: none; }
    }
  </style>
</head>
<body>
  <div class="page">
    <div class="header">
      <div>
        <div class="name">${_esc(d.name)}</div>
        <div class="headline">${_esc(d.headline)}</div>
      </div>
      <div class="contact">${details}</div>
    </div>

    <div class="section">
      <h2>Summary</h2>
      <div class="muted">${_esc(d.about)}</div>
    </div>

    <div class="section">
      <h2>Experience</h2>
      ${expSection}
    </div>

    <div class="section">
      <h2>Skills</h2>
      <div><strong>Tech:</strong> ${techChips}</div>
      <div style="margin-top:8px;"><strong>Tools:</strong> ${toolChips}</div>
    </div>

    <div class="section">
      <h2>Projects (Stores & Links)</h2>
      <ul>
        ${linksSection}
      </ul>
    </div>

    <div class="section">
      <h2>Education</h2>
      <ul>
        ${eduSection}
      </ul>
    </div>

    <div class="section">
      <h2>Languages</h2>
      <div>${langSection}</div>
    </div>
  </div>
</body>
</html>
''';
}

String _esc(String s) => s
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;')
    .replaceAll("'", '&#39;');

void _downloadResumeHtml(ProfileData d) {
  try {
    final content = _buildResumeHtml(d);
    final bytes = utf8.encode(content);
    final blob = html.Blob([bytes], 'text/html');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..download = '${d.name.replaceAll(' ', '_')}_Resume.html';
    anchor.click();
    html.Url.revokeObjectUrl(url);
  } catch (e) {
    // se quiser, exiba um SnackBar aqui
  }
}

class _DetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          spacing: 24,
          runSpacing: 16,
          children: data.details
              .map((d) => Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(d.icon, size: 18, color: Colors.white70),
                    const SizedBox(width: 8),
                    Text(d.text, style: _muted(context)),
                  ]))
              .toList(),
        ),
      ),
    );
  }
}

// ======== Small components ========
class _GridTwoColumns extends StatelessWidget {
  final Widget left;
  final Widget right;
  const _GridTwoColumns({required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1000;
    if (!isDesktop) {
      return Column(
        children: [
          left,
          const SizedBox(height: 16),
          right,
        ],
      );
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

class _Card extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const _Card({required this.child, this.padding});

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

class _Chip extends StatelessWidget {
  final String text;
  const _Chip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F25),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2A2F37)),
      ),
      child: Text(text, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;
  const _Title(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.w800));
  }
}

TextStyle _subhead(BuildContext context) => Theme.of(context)
    .textTheme
    .titleMedium!
    .copyWith(fontWeight: FontWeight.w700);

TextStyle _muted(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white70);

class _ExpTile extends StatelessWidget {
  final Experience exp;
  const _ExpTile({required this.exp});

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
                child: Text('${exp.company}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w800)),
              ),
              Text(exp.period, style: _muted(context)),
            ],
          ),
          const SizedBox(height: 8),
          Text(exp.role, style: _muted(context)),
          const SizedBox(height: 12),
          ...exp.bullets.map((b) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('•  '),
                    Expanded(child: Text(b)),
                  ],
                ),
              )),
          const SizedBox(height: 8),
          Wrap(
              spacing: 8,
              runSpacing: 8,
              children: exp.tools.map((e) => _Chip(e)).toList()),
        ],
      ),
    );
  }
}

Future<void> _launch(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
