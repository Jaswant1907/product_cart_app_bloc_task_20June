import 'package:flutter/material.dart';
import 'responsive.dart';

class TextResponsive extends StatelessWidget {
  final String text;
  final double? baseFontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  const TextResponsive({
    super.key,
    required this.text,
    this.baseFontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = getResponsiveOnWidth(context);
    final fontSize = (baseFontSize ?? 18) * responsive;

    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: color ?? Colors.black,
              fontWeight: fontWeight ?? FontWeight.normal,
              decoration: decoration,
            ),
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: overflow ?? TextOverflow.ellipsis,
          ),
        );
      },
    );
  }

}
