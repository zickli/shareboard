import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class ToolButton extends StatelessWidget {
  final String imagePath;
  final double padding;
  final double width;
  final double height;
  final Widget? popup;

  const ToolButton({
    Key? key,
    required this.imagePath,
    required this.padding,
    required this.width,
    required this.height,
    this.popup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding), // Adjust horizontal padding
      child: GestureDetector(
        onTap: () {
          print('Tapped on $imagePath');
          if (popup != null) {
            showPopover(
              context: context,
              bodyBuilder: (context) => popup!,
              width: 150,
            );
          }
        },
        child: Image.asset(imagePath, width: width, height: height), // Adjust initial size of image
      ),
    );
  }
}
