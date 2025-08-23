import 'package:flutter/material.dart';

class OutlinedAutoSizeText extends StatelessWidget {
  const OutlinedAutoSizeText(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softwrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.outlineColor,
    this.outlineWidth = 3.0, // Default outline width
    this.minFontSize = 12.0, // Minimum font size
    this.maxFontSize = 20.0, // Maximum font size
  });

  final String data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softwrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final Color? outlineColor;
  final double outlineWidth;
  final double minFontSize;
  final double maxFontSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust font size dynamically based on available width
        double calculatedFontSize = (constraints.maxWidth / data.length) * 1.5;

        // Ensure font size stays between minFontSize and maxFontSize
        double fontSize = calculatedFontSize.clamp(minFontSize, maxFontSize);

        return Stack(
          children: [
            // Outline layer
            Text(
              data,
              key: key,
              locale: locale,
              maxLines: maxLines,
              overflow: overflow,
              selectionColor: selectionColor,
              semanticsLabel: semanticsLabel,
              softWrap: softwrap,
              strutStyle: strutStyle,
              style: style?.copyWith(
                fontSize: fontSize,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = outlineWidth
                  ..color = outlineColor ?? Colors.black,
              ),
              textAlign: textAlign,
              textDirection: textDirection,
              textHeightBehavior: textHeightBehavior,
              textWidthBasis: textWidthBasis,
            ),
            // Fill layer
            Text(
              data,
              key: key,
              locale: locale,
              maxLines: maxLines,
              overflow: overflow,
              selectionColor: selectionColor,
              semanticsLabel: semanticsLabel,
              softWrap: softwrap,
              strutStyle: strutStyle,
              style: style?.copyWith(fontSize: fontSize),
              textAlign: textAlign,
              textDirection: textDirection,
              textHeightBehavior: textHeightBehavior,
              textWidthBasis: textWidthBasis,
            ),
          ],
        );
      },
    );
  }
}
