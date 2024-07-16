import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/src/home/presentation/widget/arrow_painter.dart';

class AnimatedVerticalArrows extends StatefulWidget {
  @override
  State<AnimatedVerticalArrows> createState() => _AnimatedVerticalArrowsState();
}

class _AnimatedVerticalArrowsState extends State<AnimatedVerticalArrows>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Tween<double> _rotationTween = Tween(begin: 0, end: 2);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: CustomPaint(
        size: Size(30, 50),
        painter: ArrowPainter(value: (controller.value * 100).toInt()),
      ),
    );
  }
}
