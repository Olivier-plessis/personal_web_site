import 'package:url_launcher/url_launcher.dart';

void openUrl({required String url}) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  }
}
