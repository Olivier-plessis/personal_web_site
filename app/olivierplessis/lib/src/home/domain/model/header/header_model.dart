import 'package:freezed_annotation/freezed_annotation.dart';

part 'header_model.freezed.dart';
part 'header_model.g.dart';

@freezed
class HeaderSection with _$HeaderSection {
  const factory HeaderSection({
    required String title,
    required String subtitle,
  }) = _HeaderSection;

  factory HeaderSection.fromJson(Map<String, dynamic> json) =>
      _$HeaderSectionFromJson(json);

  factory HeaderSection.empty() => const HeaderSection(
        title: '',
        subtitle: '',
      );
}
