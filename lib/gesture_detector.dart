import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'log.dart';

class MyGestureDetector extends StatefulWidget {
  /// Creates a widget that detects gestures.
  const MyGestureDetector({
    super.key,
    this.onPointerDown,
    this.onPointerMove,
    this.onPointerUp,
    // this.onPointerHover,
    this.onPointerCancel,
    // this.onPointerSignal,
    this.onScrollEvent,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
    this.behavior = HitTestBehavior.deferToChild,
    required this.child,
  });

  final Widget child;

  final Function(PointerDownEvent event)? onPointerDown;
  final Function(PointerMoveEvent event)? onPointerMove;
  final Function(PointerUpEvent event)? onPointerUp;
  final Function(PointerCancelEvent event)? onPointerCancel;
  final Function(PointerScrollEvent event)? onScrollEvent;

  final Function(ScaleStartDetails detail)? onScaleStart;
  final Function(ScaleUpdateDetails detail)? onScaleUpdate;
  final Function(ScaleEndDetails detail)? onScaleEnd;

  final HitTestBehavior behavior;

  @override
  State<MyGestureDetector> createState() => _MyGestureDetectorState();
}

enum _GestureState {
  none,
  draw,
  pan,
  scale
}

class _MyGestureDetectorState extends State<MyGestureDetector> {

  _GestureState state = _GestureState.none;
  int pointerCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: onPointerDown,
      onPointerUp: onPointerUp,
      onPointerMove: onPointerMove,
      onPointerCancel: onPointerCancel,
      onPointerSignal: onPointerSignal,
      child: GestureDetector(
        onScaleStart: onScaleStart,
        onScaleUpdate: onScaleUpdate,
        onScaleEnd: onScaleEnd,
        behavior: widget.behavior,
        child: widget.child,
      ),
    );
  }

  void onPointerDown(PointerDownEvent event) {
    Log.d("onPointerDown $pointerCounter");
    pointerCounter += 1;

    if (pointerCounter >= 2) {
      if (state == _GestureState.draw) {
        widget.onPointerCancel?.call(event as PointerCancelEvent);
      }
      state = _GestureState.scale;
    }

    if (state == _GestureState.none && pointerCounter == 1) {
      widget.onPointerDown?.call(event);
      state = _GestureState.draw;
    }
  }

  void onPointerMove(PointerMoveEvent event) {
    Log.t("onPointerMove $pointerCounter");
    if (state == _GestureState.draw) {
      widget.onPointerMove?.call(event);
    }
  }

  void onPointerUp(PointerUpEvent event) {
    pointerCounter -= 1;
    Log.d("onPointerUp $pointerCounter");

    if (pointerCounter == 0) {
      if (state == _GestureState.draw) {
        widget.onPointerUp?.call(event);
      }
      state = _GestureState.none;
    }

    if (state == _GestureState.scale && pointerCounter == 1) {
      state = _GestureState.pan;
    }

    if (pointerCounter == 0) {
      state = _GestureState.none;
    }
  }

  void onPointerCancel(PointerCancelEvent event) {
    Log.d("onPointerCancel $pointerCounter");
    if (state == _GestureState.draw) {
      widget.onPointerCancel?.call(event);
    }
  }

  void onPointerSignal(PointerSignalEvent event) {
    Log.d("onPointerSignal $pointerCounter");
  }

  void onScaleStart(ScaleStartDetails detail) {
    Log.d("onScaleStart $pointerCounter");
    if (state != _GestureState.draw) {
      widget.onScaleStart?.call(detail);
    }
  }

  void onScaleUpdate(ScaleUpdateDetails detail) {
    Log.t("onScaleUpdate $pointerCounter");
    if (state != _GestureState.draw) {
      widget.onScaleUpdate?.call(detail);
    }
  }

  void onScaleEnd(ScaleEndDetails detail) {
    Log.d("onScaleEnd $pointerCounter");
    if (state != _GestureState.draw) {
      widget.onScaleEnd?.call(detail);
    }
  }
}
