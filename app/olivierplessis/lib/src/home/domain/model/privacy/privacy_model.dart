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

List<PrivacyModel> privacy = [
  PrivacyModel(
    title: 'Informations légales.',
    description: [
      Content(
        tile: 'Présentation du site.',
        description: [
          '''En vertu de l’article 6 de la loi n°2004-575 du 21 juin 2004 pour la confiance dans l’économie numérique, il est précisé aux utilisateurs du site olivierplessis l’identité des différents intervenants dans le cadre de sa réalisation et de son suivi''',
          '''Propriétaire : Olivier Plessis – SIRET 8015 5498 1000 36 – Tours''',
          '''Créateur : Olivier Plessis''',
          '''Responsable publication : Olivier Plessis''',
          '''Le responsable publication est une personne physique ou une personne morale.''',
          '''Webmaster : Olivier Plessis – hello@olivierplessis.fr''',
          '''Hébergeur : 1&1 IONOS/UNETUN/UN-ET-UN/1ET1/ONEANDONE/ONE-AND-ONE, 7 PLACE DE LA GARE 57200 SARREGUEMINES''',
        ],
      ),
    ],
  ),
];
