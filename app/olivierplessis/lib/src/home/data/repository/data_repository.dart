import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:olivierplessis/src/home/domain/implementation/data_impl.dart';
import 'package:olivierplessis/src/home/domain/model/about/about_model.dart';
import 'package:olivierplessis/src/home/domain/model/contact/contact_model.dart';
import 'package:olivierplessis/src/home/domain/model/header/header_model.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';
import 'package:olivierplessis/src/home/domain/model/privacy/privacy_model.dart';
import 'package:olivierplessis/src/navigation/domain/model/item_nav_model.dart';

class DataRepository implements IDataRepository {
  DataRepository();

  @override
  Future<List<Navigation>?> getNavigation() async {
    try {
      final content = json.decode(
        await rootBundle.loadString('assets/data/data.json'),
      ) as Map<String, dynamic>;

      final itemsList = (content['navigation'] as List?)
          ?.map((e) => Navigation.fromJson(e as Map<String, dynamic>))
          .toList();

      return itemsList;
    } on Exception catch (e) {
      throw Exception('Error fetching navigation data: ${e}');
    }
  }

  @override
  Future<HeaderSection> getHeaderSection() async {
    try {
      final content = json.decode(
        await rootBundle.loadString('assets/data/data.json'),
      ) as Map<String, dynamic>;

      final headerData = HeaderSection.fromJson(content['header_section']);

      return headerData;
    } on Exception catch (e) {
      throw Exception('Error fetching header data: ${e}');
    }
  }

  @override
  Future<AboutSection> getAboutSection() async {
    try {
      final Map<String, dynamic> content = json.decode(
        await rootBundle.loadString('assets/data/data.json'),
      ) as Map<String, dynamic>;

      final AboutSection aboutData =
          AboutSection.fromJson(content['about_section']);

      return aboutData;
    } on Exception catch (e) {
      throw Exception('Error fetching about data: ${e}');
    }
  }

  @override
  Future<ContactSection> getContactSection() async {
    try {
      final Map<String, dynamic> content = json.decode(
        await rootBundle.loadString('assets/data/data.json'),
      ) as Map<String, dynamic>;

      final ContactSection contactData =
          ContactSection.fromJson(content['contact_section']);

      return contactData;
    } on Exception catch (e) {
      throw Exception('Error fetching contact data: ${e}');
    }
  }

  @override
  Future<PortfolioSection> getPortfolioSection() async {
    try {
      final Map<String, dynamic> content = json.decode(
        await rootBundle.loadString('assets/data/data.json'),
      ) as Map<String, dynamic>;

      final PortfolioSection portfolioData =
          PortfolioSection.fromJson(content['portfolio_section']);

      return portfolioData;
    } on Exception catch (e) {
      throw Exception('Error fetching portfolio data: ${e}');
    }
  }

  @override
  Future<WorkItem> getCurrentWorkItem({required String slug}) async {
    try {
      final Map<String, dynamic> content = json.decode(
        await rootBundle.loadString('assets/data/data.json'),
      ) as Map<String, dynamic>;

      final PortfolioSection portfolioData =
          PortfolioSection.fromJson(content['portfolio_section']);

      return portfolioData.workItems
          .firstWhere((element) => element.slug == slug);
    } on Exception catch (e) {
      throw Exception('Error fetching portfolio data: ${e}');
    }
  }

  @override
  Future<PrivacyModel> getPrivacy() async {
    try {
      final Map<String, dynamic> content = json.decode(
        await rootBundle.loadString('assets/data/data.json'),
      ) as Map<String, dynamic>;

      final PrivacyModel privacyData =
          PrivacyModel.fromJson(content['privacy_section']);

      return privacyData;
    } on Exception catch (e) {
      throw Exception('Error fetching privacy data: ${e}');
    }
  }
}
