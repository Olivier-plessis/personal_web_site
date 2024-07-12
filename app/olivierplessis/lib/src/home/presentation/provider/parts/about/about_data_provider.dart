import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:olivierplessis/src/home/domain/model/about/about_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'about_data_provider.g.dart';

@riverpod
Future<AboutSection> aboutData(AboutDataRef ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/data/data.json'),
  ) as Map<String, dynamic>;

  return AboutSection.fromJson(content['about_section']);
}
