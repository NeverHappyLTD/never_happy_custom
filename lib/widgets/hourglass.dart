import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class HourglassWidget extends StatelessWidget {
  final double percentLived;
  final double width;
  final double height;

  const HourglassWidget({
    super.key,
    required this.percentLived,
    this.width = 130,
    this.height = 260,
  });

  @override
  Widget build(BuildContext context) {
    final clamped = percentLived.clamp(0.0, 1.0);

    return TweenAnimationBuilder(
      tween: Tween(begin: 0, end: clamped),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, child) {
        return CustomPaint(
          size: Size(width, height),
          painter: _HourglassPainter(value),
        );
      },
    );
  }
}

class _HourglassPainter extends CustomPainter {
  final num percent;

  _HourglassPainter(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    const glassColor = Color(0xFFFF00AA);
    final sandColor = glassColor.withValues(alpha: .45);

    // final outlinePaint = Paint()
    //   ..color = const Color(0xFFFF00AA)
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 3
    //   ..strokeCap = StrokeCap.round;

    // final sandPaint = Paint()
    //   ..color = const Color(0xFFFF00aa).withAlpha(35)
    //   ..style = PaintingStyle.fill;

    // Geometry
    final midX = size.width * 0.5;
    final topRimY = size.height * 0.08;
    final waistY = size.height * 0.5;
    final bottomRimY = size.height * 0.9;

    final leftOuterX = size.width * 0.22;
    final rightOuterX = size.width * 0.78;

    final neckWidth = size.width * 0.06;
    final neckTopY = waistY - size.height * 0.02;
    final neckBottomY = waistY + size.height * 0.02;

    final leftInnerX = leftOuterX + size.width * 0.02;
    final rightInnerX = rightOuterX - size.width * 0.02;

    final topBulbHeight = waistY - topRimY;
    final bottomBulbHeight = bottomRimY - waistY;

    final glowPaint = Paint()
      ..color = glassColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..maskFilter = const ui.MaskFilter.blur(ui.BlurStyle.outer, 8);

    final outlinePaint = Paint()
      ..color = glassColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final sandPaint = Paint()
      ..color = sandColor
      ..style = PaintingStyle.fill;

    // 1. Curved hourglass outline
    final outline = Path()
      // 1.A Top Rim
      ..moveTo(leftOuterX, topRimY)
      ..lineTo(rightOuterX, topRimY)
      ..quadraticBezierTo(
        size.width * 0.90,
        topRimY + topBulbHeight * 0.35,
        midX + neckWidth,
        neckTopY,
      )
      // 1.B Right side: waist to bottom
      ..lineTo(midX + neckWidth, neckBottomY)
      ..quadraticBezierTo(
        size.width * 0.90,
        bottomRimY - bottomBulbHeight * 0.35,
        rightOuterX,
        bottomRimY,
      )
      // 1.C Bottom Rim
      ..lineTo(leftOuterX, bottomRimY)
      // 1.D Left side: bottom to waist
      ..quadraticBezierTo(
        size.width * 0.10,
        bottomRimY - bottomBulbHeight * 0.35,
        midX - neckWidth,
        neckBottomY,
      )
      ..lineTo(midX - neckWidth, neckTopY)
      // 1.E Left side: waist to top
      ..quadraticBezierTo(
        size.width * 0.10,
        topRimY + topBulbHeight * 0.35,
        leftOuterX,
        topRimY,
      )
      ..close();
    canvas.drawPath(outline, glowPaint);
    canvas.drawPath(outline, outlinePaint);

    // 2 . Top Bulb Path (for masking sand)
    final topBulb = Path()
      ..moveTo(leftInnerX, topRimY + 2)
      ..lineTo(rightInnerX, topRimY + 2)
      ..quadraticBezierTo(
        size.width * 0.88,
        topRimY + topBulbHeight * 0.35,
        midX + neckWidth * 0.7,
        neckTopY,
      )
      ..lineTo(midX - neckWidth * 0.7, neckTopY)
      ..quadraticBezierTo(
        size.width * 0.12,
        topRimY + topBulbHeight * 0.35,
        leftInnerX,
        topRimY + 2,
      )
      ..close();

    // 3. Bottom Bulb Path (for masking sand)
    final bottomBulb = Path()
      ..moveTo(leftInnerX, bottomRimY - 2)
      ..lineTo(rightInnerX, bottomRimY - 2)
      ..quadraticBezierTo(
        size.width * 0.88,
        bottomRimY - bottomBulbHeight * 0.35,
        midX + neckWidth * 0.7,
        neckBottomY,
      )
      ..lineTo(midX - neckWidth * 0.7, neckBottomY)
      ..quadraticBezierTo(
        size.width * 0.12,
        bottomRimY - bottomBulbHeight * 0.35,
        leftInnerX,
        bottomRimY - 2,
      )
      ..close();

    //4. Top Sand (Drains downward from neck)
    final sandHeight = topBulbHeight * (1 - percent);

    if (sandHeight > 0.0) {
      final funnelY = neckTopY + topBulbHeight * 0.05;
      final sandTopY = neckTopY - sandHeight;

      final topSandShape = Path()
        ..moveTo(rightInnerX, sandTopY)
        ..quadraticBezierTo(
          size.width * 0.88,
          sandTopY * 0.98,
          midX + neckWidth * 0.6,
          funnelY,
        )
        ..quadraticBezierTo(
          midX,
          funnelY + topBulbHeight * 0.03,
          midX - neckWidth * 0.6,
          funnelY,
        )
        ..quadraticBezierTo(
          size.width * 0.12,
          sandTopY * 0.98,
          leftInnerX,
          sandTopY,
        )
        ..close();

      final topSandPath = ui.Path.combine(
        ui.PathOperation.intersect,
        topBulb,
        topSandShape,
      );

      canvas.drawPath(topSandPath, sandPaint);
    }

    // 5. Bottom Sand (Filling, convex mound)
    final bottomFillHeight = bottomBulbHeight * percent;
    if (bottomFillHeight > 0) {
      final bottomTopY = bottomRimY - 2 - bottomFillHeight;

      final bottomSandShape = Path()
        // 5.a Bottom rim
        ..moveTo(leftInnerX, bottomRimY - 2)
        ..lineTo(rightInnerX, bottomRimY - 2)
        // 5.b Right Curved Wall
        ..quadraticBezierTo(
          size.width * 0.88,
          bottomRimY - (bottomBulbHeight * 0.35),
          midX + neckWidth * 0.7,
          bottomTopY,
        )
        // 5.c Top of Sand Mound
        ..quadraticBezierTo(
          midX,
          bottomTopY - bottomBulbHeight * 0.18,
          midX - neckWidth * 0.7,
          bottomTopY,
        )
        // 5.d Left Curved Wall
        ..quadraticBezierTo(
          size.width * 0.12,
          bottomRimY - bottomBulbHeight * 0.35,
          leftInnerX,
          bottomRimY - 2,
        )
        ..close();

      final bottomSandPath = ui.Path.combine(
        ui.PathOperation.intersect,
        bottomBulb,
        bottomSandShape,
      );
      canvas.drawPath(bottomSandPath, sandPaint);
    }
    // Falling sand

    if (percent > 0.0 && percent < 1.0) {
      final dripPaint = Paint()
        ..color = glassColor
        ..strokeWidth = 2;

      canvas.drawLine(
        Offset(midX, neckTopY),
        Offset(midX, neckBottomY),
        dripPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _HourglassPainter oldDelegate) {
    return oldDelegate.percent != percent;
  }
}
