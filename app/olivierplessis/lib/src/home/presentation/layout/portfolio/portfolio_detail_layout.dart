import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';

class PortfolioDetailLayout extends ConsumerStatefulWidget {
  const PortfolioDetailLayout({super.key, required this.slug, this.workItem});

  final String slug;
  final WorkItem? workItem;
  @override
  ConsumerState createState() => _PortfolioDetailLayoutState();
}

class _PortfolioDetailLayoutState extends ConsumerState<PortfolioDetailLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('portfolio detail ${widget.workItem?.title}'));
  }
}
