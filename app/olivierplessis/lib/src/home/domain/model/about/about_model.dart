import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_model.freezed.dart';
part 'about_model.g.dart';

@freezed
class AboutSection with _$AboutSection {
  const factory AboutSection({
    @JsonKey(name: 'section_title') required String sectionTitle,
    required String title,
    required String subtitle,
    required String link,
    required List<Info> info,
  }) = _AboutSection;

  factory AboutSection.fromJson(Map<String, dynamic> json) =>
      _$AboutSectionFromJson(json);

  factory AboutSection.empty() => AboutSection(
        sectionTitle: '',
        title: '',
        subtitle: '',
        link: '',
        info: [Info.empty()],
      );
}

@freezed
class Info with _$Info {
  const factory Info({
    required String tile,
    required String value,
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  factory Info.empty() => const Info(
        tile: '',
        value: '',
      );
}
