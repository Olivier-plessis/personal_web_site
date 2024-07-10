import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:olivierplessis/src/home/domain/model/header/header_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'header_data_provider.g.dart';

@riverpod
Future<HeaderSection> headerData(HeaderDataRef ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/data/data.json'),
  ) as Map<String, dynamic>;

  final headerData = HeaderSection.fromJson(content['header_section']);

  return headerData;
}
