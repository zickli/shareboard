import 'package:flutter/material.dart';

class eraserMenu extends StatefulWidget {
  const eraserMenu({super.key});

  @override
  State<eraserMenu> createState() => _eraserMenuState();
}

class _eraserMenuState extends State<eraserMenu> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    // thickness changer
    return Container(
      alignment: Alignment.center,
      height: 40,
      child: Slider(
        label: 'thickness',
        value: _sliderValue,
        min: 0.0,
        max: 100.0,
        onChanged: (value) {
          setState(() {
            _sliderValue = value;
          });
        },),
    );
  }
}
