import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  final int value;
  ArrowPainter({required this.value});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Palette.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    var halfWidth = size.width / 2;
    var halfHeight = size.height / 2;

    var path = Path();
    path.moveTo(halfWidth - 5, halfHeight - 12);
    path.lineTo(halfWidth, halfHeight - 7);
    path.lineTo(halfWidth + 5, halfHeight - 12);
    canvas.drawPath(
        path, paint..color = (value < 33 ? Palette.teal : Palette.tealDark));

    path = Path();
    path.moveTo(halfWidth - 7, halfHeight - 7);
    path.lineTo(halfWidth, halfHeight);
    path.lineTo(halfWidth + 7, halfHeight - 7);
    canvas.drawPath(
        path,
        paint
          ..color =
              (value > 33 && value < 66 ? Palette.teal : Palette.tealDark));

    path = Path();
    path.moveTo(halfWidth - 9, halfHeight - 2);
    path.lineTo(halfWidth, halfHeight + 7);
    path.lineTo(halfWidth + 9, halfHeight - 2);
    canvas.drawPath(
        path, paint..color = (value > 66 ? Palette.teal : Palette.tealDark));
  }

  @override
  bool shouldRepaint(ArrowPainter oldDelegate) => oldDelegate.value != value;
}
