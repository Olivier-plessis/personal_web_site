import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/main/site.dart';

Future<void> main() async {
  usePathUrlStrategy();
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const ProviderScope(child: MainApp()));
  }, (error, stackTrace) async {
    debugPrint('$error');
    debugPrint('$stackTrace');
  });
}
