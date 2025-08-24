import '../core/models/profile.dart';

String buildResumeHtml(ProfileData d) {
  String expSection = d.experiences.map((e) => '''
      <div class="exp">
        <div class="exp-header">
          <div class="role">${esc(e.role)} — <span class="company">${esc(e.company)}</span></div>
          <div class="period">${esc(e.period)}</div>
        </div>
        <ul class="bullets">
          ${e.bullets.map((b) => '<li>${esc(b)}</li>').join()}
        </ul>
        <div class="tools">${e.tools.map((t) => '<span class="chip">${esc(t)}</span>').join(' ')}</div>
      </div>
  ''').join('\n');

  String linksSection = d.links.map((l) => '<li><a href="${esc(l.url)}">${esc(l.label)}</a></li>').join('\n');

  String techChips = d.skills.tech.map((t) => '<span class="chip">${esc(t)}</span>').join(' ');
  String toolChips = d.skills.toolstack.map((t) => '<span class="chip">${esc(t)}</span>').join(' ');
  String eduSection = d.education.map((e) => '<li><strong>${esc(e.title)}</strong> — ${esc(e.place)} <span class="muted">${esc(e.period)}</span></li>').join('\n');
  String langSection = d.languages.map((l) => '<span class="chip">${esc(l)}</span>').join(' ');
  String details = d.details.map((d0) => '<span>${esc(d0.text)}</span>').join(' • ');

  return '''
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${esc(d.name)} — Resume</title>
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
        <div class="name">${esc(d.name)}</div>
        <div class="headline">${esc(d.headline)}</div>
      </div>
      <div class="contact">${details}</div>
    </div>

    <div class="section">
      <h2>Summary</h2>
      <div class="muted">${esc(d.about)}</div>
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

String esc(String s) => s
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;')
    .replaceAll("'", '&#39;');