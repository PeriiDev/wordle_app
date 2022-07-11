import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final Color backgroundColor;
  final Color borderColor;
  final double paddingVertical;
  final double paddingHorizontal;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  LinearGradient? gradient;
  Widget? child;

  Box(
      { this.child,
      this.width = 100,
      this.height = 100,
      this.borderWidth = 0,
      this.paddingHorizontal = 0,
      this.paddingVertical = 0,
      this.backgroundColor = Colors.transparent,
      this.borderColor = Colors.transparent,
      this.gradient,
      this.borderRadius = 0,
      this.marginBottom = 0,
      this.marginLeft = 0,
      this.marginRight = 0,
      this.marginTop = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: marginTop,
          bottom: marginBottom,
          left: marginLeft,
          right: marginRight),
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal, vertical: paddingVertical),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: borderWidth),
          gradient: gradient),
      child: child,
    );
  }
}