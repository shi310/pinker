import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.data, {
    super.key,
    required this.color,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.shadows,
  });

  final String data;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      shadows: shadows,
    );

    return Text(
      data,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: true,
      style: textStyle,
    );
  }
}
