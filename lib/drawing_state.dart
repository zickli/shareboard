import 'dart:ui' as ui;
import 'package:dart_jts/dart_jts.dart';
import 'geometry/extensions.dart';
import 'projection.dart';
import 'stroke.dart';

class DrawingState {
  List<Stroke> strokes = [];
  Stroke? currentStroke;
  Projection? projection;
  ui.Picture? picture;

  DrawingState();

  setWidgetSize(double width, double height) {
    final widget = Envelope(0, width, 0, height);
    projection ??= Projection(widget, widget);
    
    Envelope viewport = projection!.viewport.copy();
    if (widget.getAspectRatio() != viewport.getAspectRatio()) {
      double expectedHeight = viewport.getWidth() / widget.getAspectRatio();
      double heightDelta = expectedHeight - viewport.getHeight();
      viewport.expandBy(0.0, heightDelta / 2.0);
    }

    projection = projection?.copyWith(viewport: viewport, widget: widget);
  }

  void finishStroke() {
    strokes.add(currentStroke!);
    _updateBufferWithStroke(currentStroke!);
  }

  Future<void> _updateBufferWithStroke(Stroke stroke) async {
    // Create a picture recorder and canvas
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);

    // Draw the existing buffer
    if (picture != null) {
      canvas.drawPicture(picture!);
    }

    stroke.drawOn(canvas);

    // End recording and update the buffer
    picture = recorder.endRecording();
  }


}