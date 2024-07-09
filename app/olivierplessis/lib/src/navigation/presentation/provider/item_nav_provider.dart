import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:olivierplessis/src/navigation/domain/model/item_nav_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_nav_provider.g.dart';

@riverpod
Future<List<Navigation>> itemNavList(ItemNavListRef ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/data/data.json'),
  ) as Map<String, dynamic>;

  final itemsList = (content['navigation'] as List?)
      ?.map((e) => Navigation.fromJson(e as Map<String, dynamic>))
      .toList();

  return itemsList ?? [];
}
