import '../core/models/profile.dart';
import '../services/resume_builder.dart';
import 'resume_downloader_stub.dart'
  if (dart.library.html) 'resume_downloader_web.dart' as impl;

void downloadResume(ProfileData d) {
  final html = buildResumeHtml(d);
  impl.downloadResume('${d.name.replaceAll(' ', '_')}_Resume.html', html);
}