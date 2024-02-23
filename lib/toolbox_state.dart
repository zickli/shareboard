import 'package:flutter/foundation.dart';

enum ToolType{
  none,
  pen,
  marker,
  eraser,
  textBox
}

class ToolboxState with ChangeNotifier {
  ToolType toolType = ToolType.none;

  double _strokeWidth = 10.0;

  set strokeWidth(value) {
    _strokeWidth = value;
    notifyListeners();
  }

  double get strokeWidth => _strokeWidth;
}