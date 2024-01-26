import 'dart:ui' as ui;
import 'package:dart_jts/dart_jts.dart';
import 'package:flutter/material.dart';
import 'drawing_state.dart';
import 'geometry/extensions.dart';
import 'gesture_detector.dart';
import 'log.dart';
import 'projection.dart';
import 'stroke.dart';
import 'stroke_point.dart';

class DrawingWidget extends StatefulWidget {
  const DrawingWidget({super.key});

  @override
  State<DrawingWidget> createState() => _DrawingWidgetState();
}

class _DrawingWidgetState extends State<DrawingWidget> {
  Projection? _baseProjection;
  Offset _basePivot = Offset.zero;

  bool stylusOnlyMode = false;

  final _state = DrawingState();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        _state.setWidgetSize(constraints.maxWidth, constraints.maxHeight);
        return LGestureDetector(
          onScaleStart: onScaleStart,
          onScaleUpdate: onScaleUpdate,
          onScaleEnd: onScaleEnd,
          onMoveStart: onMoveStart,
          onMoveUpdate: onMoveUpdate,
          onMoveEnd: onMoveEnd,
          child: CustomPaint(
              painter: StrokePainter(_state),
          ),
        );
      },
    );
  }

  bool isDrawing(PointerEvent event) {
    return !stylusOnlyMode || (stylusOnlyMode && event.kind == ui.PointerDeviceKind.stylus);
  }

  void onMoveStart(PointerMoveEvent event) {
    if (isDrawing(event)) {
      _state.currentStroke = Stroke();
      draw(StrokePoint.fromEvent(event));
    } else {
      pan(event.delta);
    }
  }

  void onMoveUpdate(PointerMoveEvent event) {
    if (isDrawing(event)) {
      draw(StrokePoint.fromEvent(event));
    } else {
      pan(event.delta);
    }
  }

  void onMoveEnd(PointerEvent event) {
    if (isDrawing(event)) {
      draw(StrokePoint.fromEvent(event));
      _state.finishStroke();
    } else {
      pan(event.delta);
    }
  }

  void pan(Offset offset) {
    setState(() {
      final projection = _state.projection!;
      _state.projection = projection.copyWith(
          viewport: projection.viewport.translated(offset.dx, offset.dy));
    });
  }

  void draw(StrokePoint point) {
    setState(() {
      _state.currentStroke
          ?.append(point.applied(_state.projection!.transformation));
    });
  }

  void onScaleStart(Offset focalPoint) {
    Log.d("onScaleStart $focalPoint}");
    _baseProjection = _state.projection?.copyWith();
    _basePivot = focalPoint;
  }

  void onScaleUpdate(ScaleEvent event) {
    Envelope viewport = _baseProjection!.viewport;

    final scale = event.scale;
    final pivot = event.focalPoint;
    Offset translate = pivot - _basePivot;

    viewport = viewport.translated(translate.dx, translate.dy);
    viewport = viewport.scaledXY(scale, scale, pivot.dx, pivot.dy);

    setState(() {
      _state.projection = _state.projection?.copyWith(viewport: viewport);
    });
  }

  void onScaleEnd() {
    Log.d("onScaleEnd");
  }
}

class StrokePainter extends CustomPainter {
  final DrawingState _state;

  StrokePainter(this._state);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, Paint()..color = Colors.cyan.shade50);

    canvas.save();

    canvas.transform(_state.projection!.invertedTransformation.toFloat64List());

    if (_state.picture != null) {
      canvas.drawPicture(_state.picture!);
    }
    _state.currentStroke?.drawOn(canvas);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
