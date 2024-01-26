import 'package:flutter/material.dart';
import 'package:dart_jts/dart_jts.dart';
import 'package:perfect_freehand/perfect_freehand.dart' as pf;
import 'log.dart';
import 'stroke_point.dart';

class Stroke {
  List<StrokePoint> points = [];

  LinearRing? outline;

  Stroke();

  void append(StrokePoint point) {
    points.add(point);
    outline = _generateOutline();
  }

  LinearRing _generateOutline() {
    final geometryFactory = GeometryFactory.defaultPrecision();

    List<pf.Point> pfPoints = points.map((sp) => pf.Point(sp.x, sp.y, sp.pressure)).toList();
    List<pf.Point> pfOutline = pf.getStroke(pfPoints, simulatePressure: false);
    List<Coordinate> coordinates = pfOutline.map((p) => Coordinate(p.x, p.y)).toList();
    coordinates.add(coordinates.first);
    LinearRing outline = geometryFactory.createLinearRing(coordinates);
    return outline;
  }

  void drawOn(Canvas canvas) {
    Paint paint = Paint() ..color = Colors.black;

    final path = Path();

    final outlinePoints = outline?.getCoordinates() ?? [];

    if (outlinePoints.isEmpty) {
      return;
    } else if (outlinePoints.length < 2) {
      path.addOval(Rect.fromCircle(
          center: Offset(outlinePoints[0].x, outlinePoints[0].y), radius: 1));
    } else {
      path.moveTo(outlinePoints[0].x, outlinePoints[0].y);
      for (int i = 1; i < outlinePoints.length - 1; ++i) {
        final p0 = outlinePoints[i];
        final p1 = outlinePoints[i + 1];
        path.quadraticBezierTo(
            p0.x, p0.y, (p0.x + p1.x) / 2, (p0.y + p1.y) / 2);
      }
    }

    canvas.drawPath(path, paint);
  }
}