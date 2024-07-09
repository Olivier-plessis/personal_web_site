import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_nav_model.freezed.dart';
part 'item_nav_model.g.dart';

@freezed
class Navigation with _$Navigation {
  factory Navigation({
    required List<Item> items,
  }) = _Navigation;

  factory Navigation.fromJson(Map<String, dynamic> json) => _$NavigationFromJson(json);
}

@freezed
class Item with _$Item {
  factory Item({
    required String title,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
