import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_model.freezed.dart';
part 'privacy_model.g.dart';

@freezed
class PrivacyModel with _$PrivacyModel {
  factory PrivacyModel({
    required String title,
    required List<Content> description,
  }) = _PrivacyModel;

  factory PrivacyModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyModelFromJson(json);

  factory PrivacyModel.empty() => PrivacyModel(
        title: '',
        description: [Content.empty()],
      );
}

@freezed
class Content with _$Content {
  const factory Content({
    required String tile,
    required List<String> description,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  factory Content.empty() => const Content(
        tile: '',
        description: [''],
      );
}
