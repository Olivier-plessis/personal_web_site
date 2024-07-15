import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';

class PortfolioLargeSlider extends ConsumerStatefulWidget {
  const PortfolioLargeSlider({super.key, required this.workItem});
  final List<WorkItem> workItem;
  @override
  ConsumerState createState() => _PortfolioLargeSliderState();
}

class _PortfolioLargeSliderState extends ConsumerState<PortfolioLargeSlider>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
          child: FittedBox(
              fit: BoxFit.fitWidth,
              child: SizedBox(
                height: 450,
                child: ListView.builder(
                  itemCount: widget.workItem.take(5).length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  addRepaintBoundaries: true,
                  itemBuilder: (context, index) {
                    final item =
                        widget.workItem[index % widget.workItem.length];

                    return Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: AnimatedCardItem(
                        key: ValueKey(index),
                        title: item.title,
                        subtitle: item.subtitle,
                        image: item.coverImage,
                        isExpanded: _selectedIndex == index,
                        animation: _controller,
                        onTap: () => onExpand(index),
                      ),
                    );
                  },
                ),
              )))
    ]);
  }

  void onExpand(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedCardItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  final IconData icon;
  final Animation<double> animation;
  final bool isExpanded;
  final VoidCallback onTap;
  final Color iconColor;

  const AnimatedCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.icon = Icons.arrow_forward_sharp,
    required this.animation,
    required this.isExpanded,
    required this.onTap,
    this.iconColor = Palette.violet,
  });

  @override
  State<AnimatedCardItem> createState() => _AnimatedCardItemState();
}

class _AnimatedCardItemState extends State<AnimatedCardItem> {
  bool shouldRect = false;

  @override
  void didUpdateWidget(AnimatedCardItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.isExpanded != widget.isExpanded
        ? shouldRect = true
        : shouldRect = false;
  }

  @override
  Widget build(BuildContext context) {
    const double collapsedWidth = 130;
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          widget.onTap.call();

          /// TODO: Navigate to work item
          print('tap');
        },
        child: AnimatedBuilder(
          animation: widget.animation,
          builder: (context, child) {
            double value = shouldRect
                ? widget.isExpanded
                    ? widget.animation.value
                    : 1 - widget.animation.value
                : widget.isExpanded
                    ? 1
                    : 0;

            final double animValue = Interval(
                    widget.isExpanded ? 0 : 0.5, widget.isExpanded ? 0.5 : 1,
                    curve: Curves.fastOutSlowIn)
                .transform(value);

            final imageScaleValue = Interval(widget.isExpanded ? 0.2 : 0.8, 1,
                    curve: Curves.easeOut)
                .transform(value);

            final double titleValue =
                Interval(0.2, 0.8, curve: Curves.easeOut).transform(value);
            final double subtitleValue =
                Interval(0.4, 0.8, curve: Curves.easeOut).transform(value);

            return Transform.scale(
              scale: 1 + animValue * 0.02,
              child: Container(
                width: collapsedWidth + animValue * (800 - collapsedWidth),
                height: widget.isExpanded ? 800 + (animValue * 20) : 250,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(collapsedWidth / 6),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Transform.scale(
                        scale: 1.2 - imageScaleValue * 0.13,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                widget.image,
                                package: "design_ui",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Palette.violet.withOpacity(0),
                                Palette.grey.withOpacity(0.8),
                              ],
                              stops: const [0.7, 1],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10 + animValue * 10,
                          vertical: 10 + animValue * 12,
                        ),
                        child: Row(
                          children: [
                            if (widget.isExpanded)
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Opacity(
                                        opacity: titleValue,
                                        child: Transform.translate(
                                          offset: Offset(
                                            20 * (1 - titleValue),
                                            0,
                                          ),
                                          child: Text(
                                            widget.title,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // const SizedBox(height: 2),
                                      Opacity(
                                        opacity: subtitleValue,
                                        child: Transform.translate(
                                          offset: Offset(
                                            20 * (1 - subtitleValue),
                                            0,
                                          ),
                                          child: Text(
                                            widget.subtitle,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
