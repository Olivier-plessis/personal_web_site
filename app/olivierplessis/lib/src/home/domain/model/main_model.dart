import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:olivierplessis/src/navigation/domain/model/item_nav_model.dart';

part 'main_model.freezed.dart';
part 'main_model.g.dart';

@freezed
class MainModel with _$MainModel {
  factory MainModel({
    required List<Navigation> navigation,
  }) = _MainModel;

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);
}
