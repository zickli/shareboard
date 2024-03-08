import 'package:flutter/material.dart';
import 'package:shareboard/utils/app_colors.dart';

class ColorButton extends StatefulWidget {
  const ColorButton({
    Key? key,
    required this.color,
    required this.size,
    required this.onTap
  }) : super(key: key);

  final Color color;
  final double size;
  final VoidCallback onTap;

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: AppColors.white,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: widget.size * 0.05,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class ColorTool extends StatefulWidget {
  const ColorTool({
    Key? key,
    required this.selectedColor,
}) : super(key: key);

  final Color selectedColor;

  @override
  State<ColorTool> createState() => _ColorToolState();
}

class _ColorToolState extends State<ColorTool> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      height: 37,
      decoration: BoxDecoration(
        color: widget.selectedColor == Colors.transparent ? AppColors.gray7E7 : widget.selectedColor.withAlpha(255),
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: AppColors.white,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            spreadRadius: 3.5,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}