import 'package:flutter/material.dart';

extension PaddingExt on Widget {
  Widget paddedH(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  Widget paddedV(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Widget paddedHV(double horizontal, double vertical) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget paddedL(double value) {
    return Padding(
      padding: EdgeInsets.only(left: value),
      child: this,
    );
  }

  Widget paddedR(double value) {
    return Padding(
      padding: EdgeInsets.only(right: value),
      child: this,
    );
  }

  Widget paddedLR(double value, double rightValue) {
    return Padding(
      padding: EdgeInsets.only(left: value, right: value),
      child: this,
    );
  }

  Widget paddedT(double value) {
    return Padding(
      padding: EdgeInsets.only(top: value),
      child: this,
    );
  }

  Widget paddedB(double value) {
    return Padding(
      padding: EdgeInsets.only(bottom: value),
      child: this,
    );
  }

  Widget paddedTB(double value, double bottomValue) {
    return Padding(
      padding: EdgeInsets.only(top: value, bottom: bottomValue),
      child: this,
    );
  }

  Widget paddedAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddedLTRB(double left, double top, double right, double bottom) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: this,
    );
  }
}
