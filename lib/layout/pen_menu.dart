import 'package:flutter/material.dart';

class penMenu extends StatefulWidget {
  const penMenu({super.key});

  @override
  State<penMenu> createState() => _penMenuState();
}

class _penMenuState extends State<penMenu> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          // thickness changer
          Container(
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
          ),
          // color changer
          Container(
            alignment: Alignment.center,
            height: 40,
            child: Text('color changer'),
          )
        ],
      ),
    );
  }
}
