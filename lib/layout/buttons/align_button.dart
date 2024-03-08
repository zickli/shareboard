import 'package:flutter/material.dart';
import 'package:shareboard/utils/app_colors.dart';

class alignButton extends StatefulWidget {
  const alignButton({
    Key? key,
    required this.imagePath,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  final String imagePath;
  final int index;
  final int selectedIndex;
  final VoidCallback onTap;

  @override
  State<StatefulWidget> createState() => _alignButtonState();
}

class _alignButtonState extends State<alignButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0), // Adjust horizontal padding
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: widget.index == widget.selectedIndex ? AppColors.gray4C4 : Colors.transparent,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(widget.imagePath, width: 20, height: 20),
          ),),
      ),
    );
  }
}