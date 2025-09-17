import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:notes_app/draw/drawing_point.dart';

class DrawingPainter extends CustomPainter {
  final List<DrawingPoint?> drawingPoints;

  DrawingPainter({required this.drawingPoints});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoints.length - 1; i++) {
      if (drawingPoints[i] != null && drawingPoints[i + 1] != null) {
        canvas.drawLine(
          drawingPoints[i]!.point,
          drawingPoints[i + 1]!.point,
          drawingPoints[i]!.paint,
        );
      } else if (drawingPoints[i] != null) {
        // Hanya menggambar titik jika drawingPoints[i + 1] adalah null
        canvas.drawPoints(PointMode.points,
        [drawingPoints[i]!.point],
        drawingPoints[i]!.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}