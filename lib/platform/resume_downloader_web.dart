import 'dart:convert';
import 'dart:html' as html;

void downloadResume(String filename, String htmlContent) {
  final bytes = utf8.encode(htmlContent);
  final blob = html.Blob([bytes], 'text/html');
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)..download = filename;
  anchor.click();
  html.Url.revokeObjectUrl(url);
}