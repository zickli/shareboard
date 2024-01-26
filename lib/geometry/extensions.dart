import 'package:dart_jts/dart_jts.dart';
import 'dart:typed_data';

extension EnvelopeExtension on Envelope {
  double getAspectRatio() {
    return getWidth() / getHeight();
  }

  Envelope scaled(double xScale, double yScale) {
    final center = centre() ?? CoordinateXY();
    return scaledXY(xScale, yScale, center.x, center.y);
  }

  Envelope scaledXY(double xScale, double yScale, double x, double y) {
    final factory = GeometryFactory.defaultPrecision();
    final transformation = AffineTransformation.scaleInstanceScaleXY(
        xScale, yScale, x, y);

    Geometry polygon = factory.toGeometry(this);
    Geometry transformed = transformation.transformGeom(polygon);

    return transformed.getEnvelopeInternal();
  }

  Envelope translated(double transX, double transY) {
    Envelope envelope = copy();
    envelope.translate(transX, transY);
    return envelope;
  }
}

extension AffineTransformationExtension on AffineTransformation {
  Float64List toFloat64List() {
    Float64List list = Float64List(16);

    list[0] = m00;
    list[1] = m10;
    list[4] = m01;
    list[5] = m11;

    list[12] = m02;
    list[13] = m12;

    list[10] = 1.0;
    list[15] = 1.0;

    return list;
  }
}
