import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'main/site.dart';

Future<void> mainSite() async {
 runZonedGuarded(() async {
   WidgetsFlutterBinding.ensureInitialized();
     runApp(const ProviderScope(child: MainApp()));
  }, (error, stackTrace) async {
    print(error);
    print(stackTrace);
  });
}
