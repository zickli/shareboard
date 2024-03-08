import 'package:flutter/material.dart';

class shapeButton extends StatelessWidget {
  const shapeButton({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0), // Adjust horizontal padding
      child: GestureDetector(
        onTap: () {
          print('Tapped on $imagePath');
          Navigator.of(context).pop(); // Dismiss the popover
        },
        child: Image.asset(imagePath, width: 40, height: 40) // Adjust initial size of image
      ),
    );
  }
}
