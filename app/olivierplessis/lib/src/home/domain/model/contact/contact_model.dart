import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
class ContactSection with _$ContactSection {
  const factory ContactSection({
    required String title,
    required String email,
    required String phone,
    required String link,
    @JsonKey(name: 'follow_me') required String followMe,
    @JsonKey(name: 'social_links') required List<SocialLink> socialLinks,
  }) = _ContactSection;

  factory ContactSection.fromJson(Map<String, dynamic> json) =>
      _$ContactSectionFromJson(json);

  factory ContactSection.empty() => ContactSection(
        title: '',
        email: '',
        phone: '',
        link: '',
        followMe: '',
        socialLinks: [SocialLink.empty()],
      );
}

@freezed
class SocialLink with _$SocialLink {
  const factory SocialLink({
    required String name,
    required String link,
  }) = _SocialLink;

  factory SocialLink.fromJson(Map<String, dynamic> json) =>
      _$SocialLinkFromJson(json);

  factory SocialLink.empty() => SocialLink(
        name: '',
        link: '',
      );
}
