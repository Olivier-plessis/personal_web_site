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
    required String title,
    required String category,
    required List<String> tags,
    required String subtitle,
    required String description,
    @JsonKey(name: 'cover_image') required String coverImage,
    @JsonKey(name: 'work_type') required String workType,
    required List<Link> link,
  }) = _WorkItem;

  factory WorkItem.fromJson(Map<String, dynamic> json) =>
      _$WorkItemFromJson(json);

  factory WorkItem.empty() => const WorkItem(
        title: '',
        category: '',
        tags: [''],
        subtitle: '',
        description: '',
        workType: '',
        coverImage: '',
        link: [],
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
