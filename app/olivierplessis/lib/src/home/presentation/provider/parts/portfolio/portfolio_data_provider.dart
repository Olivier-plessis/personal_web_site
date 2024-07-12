import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'portfolio_data_provider.g.dart';

@riverpod
Future<PortfolioSection> portfolioData(PortfolioDataRef ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/data/data.json'),
  ) as Map<String, dynamic>;

  return PortfolioSection.fromJson(content['portfolio_section']);
}
