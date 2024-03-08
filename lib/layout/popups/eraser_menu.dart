import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class eraserMenu extends StatefulWidget {
  const eraserMenu({super.key});

  @override
  State<eraserMenu> createState() => _eraserMenuState();
}

class _eraserMenuState extends State<eraserMenu> {
  double _sliderValue = 0.0;
  Color _circleColor = AppColors.gray4C4;

  @override
  Widget build(BuildContext context) {
    return _buildThicknessChanger();
  }

  Widget _buildThicknessChanger() {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Container(
            width: 5.0,
            height: 5.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _circleColor,
            ),
          ),
          Flexible(
              child: Slider(
                label: 'thickness',
                value: _sliderValue,
                min: 0.0,
                max: 100.0,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              )
          ),
          Transform.scale(
            scale: 4.0,
            child: Container(
              width: 5.0,
              height: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _circleColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
