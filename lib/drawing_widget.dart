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
        return MyGestureDetector(
          onPointerDown: onPointerDown,
          onPointerMove: onPointerMove,
          onPointerUp: onPointerUp,
          onScaleStart: onScaleStart,
          onScaleUpdate: onScaleUpdate,
          onScaleEnd: onScaleEnd,
          behavior: HitTestBehavior.translucent,
          child: CustomPaint(
            painter: StrokePainter(_state),
            child: Container(),
          ),
        );
      },
    );
  }

  bool isDrawing(PointerEvent event) {
    return !stylusOnlyMode ||
        (stylusOnlyMode && event.kind == ui.PointerDeviceKind.stylus);
  }

  void onPointerDown(PointerDownEvent event) {
    if (isDrawing(event)) {
      _state.currentStroke = Stroke();
      draw(StrokePoint.fromEvent(event));
    }
  }

  void onPointerMove(PointerMoveEvent event) {
    if (isDrawing(event)) {
      draw(StrokePoint.fromEvent(event));
    }
  }

  void onPointerUp(PointerUpEvent event) {
    if (isDrawing(event)) {
      draw(StrokePoint.fromEvent(event));
      _state.finishStroke();
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

  void onScaleStart(ScaleStartDetails details) {
    final focalPoint = details.focalPoint;
    Log.d("onScaleStart $focalPoint}");
    _baseProjection = _state.projection?.copyWith();
    _basePivot = focalPoint;
  }

  void onScaleUpdate(ScaleUpdateDetails details) {
    Envelope viewport = _baseProjection!.viewport;

    final scale = details.scale;
    final pivot = details.focalPoint;
    Offset translate = pivot - _basePivot;

    viewport = viewport.translated(translate.dx, translate.dy);
    viewport = viewport.scaledXY(scale, scale, pivot.dx, pivot.dy);

    setState(() {
      _state.projection = _state.projection?.copyWith(viewport: viewport);
    });
  }

  void onScaleEnd(ScaleEndDetails details) {
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
