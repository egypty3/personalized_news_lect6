import 'dart:ui';

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxlines;
  final String fontFamily;
  final double letterSpacing;

  const AppText({super.key, required this.text,
    this.fontSize=14.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.maxlines = 1,
    this.fontFamily = 'lufga',
    this.letterSpacing = 1});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontFamily: fontFamily.isNotEmpty ? fontFamily : null,
        letterSpacing: letterSpacing
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxlines,
    );
  }
}
