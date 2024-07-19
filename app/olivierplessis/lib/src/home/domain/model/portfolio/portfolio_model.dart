import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_model.freezed.dart';
part 'portfolio_model.g.dart';

@freezed
class PortfolioSection with _$PortfolioSection {
  const factory PortfolioSection({
    required String title,
    @JsonKey(name: 'work_items') required List<WorkItem> workItems,
  }) = _PortfolioSection;

  factory PortfolioSection.fromJson(Map<String, dynamic> json) =>
      _$PortfolioSectionFromJson(json);

  factory PortfolioSection.empty() => const PortfolioSection(
        title: '',
        workItems: [],
      );
}

@freezed
class WorkItem with _$WorkItem {
  const factory WorkItem({
    required String slug,
    required String title,
    required String category,
    required List<String> tags,
    required String subtitle,
    required String description,
    @JsonKey(name: 'cover_image') required String coverImage,
    required String logo,
    @JsonKey(name: 'work_type') required String workType,
    @JsonKey(name: 'entrusted_task') required String entrustedTask,
    @JsonKey(name: 'account_of') required AccountOf accountOf,
    required Link link,
    @JsonKey(name: 'realisation_date') required String realisationDate,
  }) = _WorkItem;

  factory WorkItem.fromJson(Map<String, dynamic> json) =>
      _$WorkItemFromJson(json);

  factory WorkItem.empty() => WorkItem(
        slug: '',
        title: '',
        category: '',
        tags: [''],
        subtitle: '',
        description: '',
        coverImage: '',
        logo: '',
        workType: '',
        entrustedTask: '',
        accountOf: AccountOf.empty(),
        link: Link.empty(),
        realisationDate: '',
      );
}

@freezed
class AccountOf with _$AccountOf {
  const factory AccountOf({
    required String name,
    required String logo,
    @JsonKey(name: 'website_url') required String websiteUrl,
  }) = _AccountOf;

  factory AccountOf.fromJson(Map<String, dynamic> json) =>
      _$AccountOfFromJson(json);

  factory AccountOf.empty() => const AccountOf(
        name: '',
        logo: '',
        websiteUrl: '',
      );
}

@freezed
class Link with _$Link {
  const factory Link({
    @JsonKey(name: 'website_url') required String websiteUrl,
    @JsonKey(name: 'store_ios') required String storeIos,
    @JsonKey(name: 'store_android') required String storeAndroid,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  factory Link.empty() => const Link(
        websiteUrl: '',
        storeIos: '',
        storeAndroid: '',
      );
}
