import 'package:flutter/material.dart';
import 'package:shareboard/utils/app_colors.dart';

class fontButton extends StatefulWidget {
  const fontButton({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  State<StatefulWidget> createState() => _fontButtonState();
}

class _fontButtonState extends State<fontButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0), // Adjust horizontal padding
      child: GestureDetector(
        onTap: () {
          print('Tapped on $widget.imagePath');
          setState(() {
            _isTapped = !_isTapped;
          });
        },
        child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: _isTapped ? AppColors.gray4C4 : Colors.transparent,
            ),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(widget.imagePath, width: 18, height: 18),
          ),),
      ),
    );
  }
}
