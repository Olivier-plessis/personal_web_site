import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:olivierplessis/src/home/domain/model/contact/contact_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_data_provider.g.dart';

@riverpod
Future<ContactSection> contactData(ContactDataRef ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/data/data.json'),
  ) as Map<String, dynamic>;

  return ContactSection.fromJson(content['contact_section']);
}
