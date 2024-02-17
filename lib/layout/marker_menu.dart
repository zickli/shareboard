import 'package:flutter/material.dart';

class markerMenu extends StatefulWidget {
  const markerMenu({super.key});

  @override
  State<markerMenu> createState() => _markerMenuState();
}

class _markerMenuState extends State<markerMenu> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
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
          // transparency changer
          Container(
            alignment: Alignment.center,
            height: 40,
            child: Text('transparency changer'),
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
