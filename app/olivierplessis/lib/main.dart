import 'dart:async';

import 'package:flutter/material.dart';

import 'main/site.dart';

Future<void> mainSite() async {
 runZonedGuarded(() async {
   WidgetsFlutterBinding.ensureInitialized();
     runApp(const MainApp());
  }, (error, stackTrace) async {
    print(error);
    print(stackTrace);
  });
}
