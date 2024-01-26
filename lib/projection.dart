import 'package:dart_jts/dart_jts.dart';

class Projection {
  final Envelope viewport;
  final Envelope widget;

  Projection(this.viewport, this.widget);

  AffineTransformation get transformation =>
      AffineTransformationFunctions.viewportTrans(viewport, widget);

  AffineTransformation get invertedTransformation =>
      AffineTransformationFunctions.viewportTrans(widget, viewport);

  Projection copy() => copyWith();

  Projection copyWith({Envelope? viewport, Envelope? widget}) =>
      Projection(viewport ?? this.viewport, widget ?? this.widget);
}
