import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';
import 'package:olivierplessis/src/home/presentation/layout/portfolio/work_detail_item_layout.dart';
import 'package:olivierplessis/src/home/presentation/widget/animated_vertical_arrrow.dart';

class PortfolioDetailLayout extends ConsumerStatefulWidget {
  const PortfolioDetailLayout(
      {super.key, required this.slug, required this.workItem});

  final String slug;
  final WorkItem? workItem;
  @override
  ConsumerState createState() => _PortfolioDetailLayoutState();
}

class _PortfolioDetailLayoutState extends ConsumerState<PortfolioDetailLayout>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final PageController _pageController;
  double offset = 0;
  late final Animation<double> _sizeXAnimation;
  late final Animation<double> _sizeYAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        context.pop();
      }
    });
    _pageController = PageController();
    _pageController.addListener(() {
      final screenHeight = MediaQuery.of(context).size.height;
      setState(() {
        offset = _pageController.offset / screenHeight;
      });
    });

    _sizeXAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(_animationController);

    _sizeYAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: _sizeXAnimation.value,
      scaleY: _sizeYAnimation.value,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(context),
        body: Stack(
          children: [
            _buildBackground(),
            _buildHeader(),
            PageView(
              pageSnapping: false,
              scrollDirection: Axis.vertical,
              controller: _pageController,
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                const SizedBox.shrink(),
                WorkDetailItemLayout(workItem: widget.workItem),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () => context.pop(),
        style: IconButton.styleFrom(
          backgroundColor: Color.lerp(
                  Colors.white, Colors.black.withOpacity(0.25), 1 - offset) ??
              Colors.transparent,
        ),
        icon: Icon(Icons.close,
            color: Color.lerp(Colors.white, Colors.black, offset)),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildHeader() {
    return Align(
      alignment: FractionalOffset(0, 1 - (offset)),
      child: SafeArea(
        child: Container(
          width: MaxSizeConstant.maxWidth,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'date',
                child: Opacity(
                  opacity: 1 - offset,
                  child: Text(
                    widget.workItem?.realisationDate ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Color.lerp(Colors.white, Colors.white, offset),
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                runAlignment: WrapAlignment.spaceBetween,
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: context.isDisplayLargeThanTablet ? 0.2 : 1,
                    child: Hero(
                      tag: 'title',
                      child: Text(
                        widget.workItem?.description ?? '',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Color.lerp(
                                  Palette.white, Palette.teal, offset),
                              fontWeight: FontWeight.bold,
                            ),
                      ).paddedB(24),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: context.isDisplayLargeThanTablet ? 0.6 : 1,
                    child: Opacity(
                        opacity: 1 - offset,
                        child: Center(
                            child: AnimatedVerticalArrows().paddedB(24))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _buildBackground() {
    return Positioned.fill(
      child: Opacity(
        opacity: 1 - ((offset >= 0.0 && offset <= 1.0) ? offset : 0),
        child: Container(
          foregroundDecoration: BoxDecoration(
            backgroundBlendMode: BlendMode.srcOver,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Palette.teal.withOpacity(0),
                Palette.grey.withOpacity(0.8),
              ],
              stops: const [0.5, 1],
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                widget.workItem?.coverImage ?? '',
                package: 'design_ui',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
