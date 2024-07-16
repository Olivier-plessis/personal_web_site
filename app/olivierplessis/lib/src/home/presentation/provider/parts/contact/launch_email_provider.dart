import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'launch_email_provider.g.dart';

@riverpod
Future<void> launchMailto(
  LaunchMailtoRef ref,
  String localeSubject,
  String exception,
) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'hello@olivierplessis.fr',
    queryParameters: {
      'subject': localeSubject.replaceAll(' ', "\u00A0"),
      'body': ''
    },
  );
  if (await canLaunchUrl(params)) {
    await launchUrl(
      params,
    );
  } else {
    throw Exception(exception);
  }
}
