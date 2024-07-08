import 'package:flutter/material.dart';

class ToolbarItem {
  final String text;
  final GestureTapCallback? onTap;

  ToolbarItem({
    required this.text,
    this.onTap,
  });
}
