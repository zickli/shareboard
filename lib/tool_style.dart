import 'package:flutter/material.dart';
import 'package:shareboard/utils/app_colors.dart';

class ToolStyle {
  double strokeWidth = 10.0;
  Color toolColor = AppColors.black;

  ToolStyle(double strokeWidth, Color strokeColor) {
    this.strokeWidth = strokeWidth;
    this.toolColor = strokeColor;
  }
}