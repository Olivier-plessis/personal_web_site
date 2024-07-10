import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:olivierplessis/src/home/domain/model/about/about_model.dart';
import 'package:olivierplessis/src/home/domain/model/header/header_model.dart';
import 'package:olivierplessis/src/navigation/domain/model/item_nav_model.dart';

part 'main_model.freezed.dart';
part 'main_model.g.dart';

@freezed
class MainModel with _$MainModel {
  factory MainModel({
    required List<Navigation> navigation,
    required HeaderSection header,
    required AboutSection about,
  }) = _MainModel;

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);
}
