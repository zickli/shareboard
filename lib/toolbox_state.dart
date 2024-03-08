import 'package:flutter/material.dart';
import 'package:shareboard/tool_style.dart';
import 'package:shareboard/utils/app_colors.dart';

enum ToolType{
  none,
  pen,
  highlighter,
  eraser,
  shapes,
  textBox,
}

class ToolboxState with ChangeNotifier {
  ToolType _toolType = ToolType.pen;
  set toolType(value) {
    saveCurrentStyle();
    retrieveToolStyle(value);
    _toolType = value;
    notifyListeners();
  }
  ToolType get toolType => _toolType;

  double _strokeWidth = 10.0;
  set strokeWidth(value) {
    _strokeWidth = value;
    notifyListeners();
  }
  double get strokeWidth => _strokeWidth;

  Color _toolColor = AppColors.black;
  set toolColor(value) {
    _toolColor = value;
    notifyListeners();
  }
  Color get toolColor => _toolColor;

  ToolStyle penStyle = ToolStyle(10.0, AppColors.black);
  ToolStyle highlighterStyle = ToolStyle(30.0, AppColors.transparentYellow);
  ToolStyle eraserStyle = ToolStyle(10.0, Colors.transparent);
  ToolStyle shapeStyle = ToolStyle(10.0, AppColors.black);

  void saveCurrentStyle() {
    if (toolType == ToolType.pen) {
      penStyle.strokeWidth = _strokeWidth;
      penStyle.toolColor = _toolColor;
    } else if (toolType == ToolType.highlighter) {
      highlighterStyle.strokeWidth = _strokeWidth;
      highlighterStyle.toolColor = _toolColor;
    } else if (toolType == ToolType.eraser) {
      eraserStyle.strokeWidth = _strokeWidth;
      eraserStyle.toolColor = _toolColor;
    } else if (toolType == ToolType.shapes) {
      shapeStyle.strokeWidth = _strokeWidth;
      shapeStyle.toolColor = _toolColor;
    }
  }

  void retrieveToolStyle(ToolType tool) {
    if (tool == ToolType.pen) {
      _strokeWidth = penStyle.strokeWidth;
      _toolColor = penStyle.toolColor;
    } else if (tool == ToolType.highlighter) {
      _strokeWidth = highlighterStyle.strokeWidth;
      _toolColor = highlighterStyle.toolColor;
    } else if (tool == ToolType.eraser) {
      _strokeWidth = eraserStyle.strokeWidth;
      _toolColor = eraserStyle.toolColor;
    } else if (tool == ToolType.shapes) {
      _strokeWidth = shapeStyle.strokeWidth;
      _toolColor = shapeStyle.toolColor;
    }
  }
}