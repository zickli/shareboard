import 'package:flutter/gestures.dart';
import 'package:dart_jts/dart_jts.dart';

class StrokePoint extends Coordinate {
  final Duration timeStamp;
  final PointerDeviceKind kind;
  final double pressure;
  final double orientation;
  final double tilt;
  final bool synthesized;

  StrokePoint(super.x, super.y,
      {this.timeStamp = Duration.zero,
      this.kind = PointerDeviceKind.touch,
      this.pressure = 1.0,
      this.orientation = 0.0,
      this.tilt = 0.0,
      this.synthesized = false});

  StrokePoint.fromEvent(PointerEvent event)
      : this(event.position.dx, event.position.dy,
            timeStamp: event.timeStamp,
            kind: event.kind,
            pressure: event.pressure,
            orientation: event.orientation,
            tilt: event.tilt,
            synthesized: event.synthesized);

  @override
  StrokePoint copy() => StrokePoint(x, y,
      timeStamp: timeStamp,
      kind: kind,
      pressure: pressure,
      orientation: orientation,
      tilt: tilt,
      synthesized: synthesized);

  StrokePoint applied(AffineTransformation affine) {
    StrokePoint transformed = copy();
    affine.transform(this, transformed);
    return transformed;
  }
}
