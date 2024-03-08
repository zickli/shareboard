import 'package:flutter/material.dart';
import 'package:shareboard/utils/app_colors.dart';

import '../../toolbox_state.dart';

class PenMenu extends StatefulWidget {
  const PenMenu({super.key, required this.toolboxState});

  final ToolboxState toolboxState;

  @override
  State<PenMenu> createState() => _PenMenuState();
}

class _PenMenuState extends State<PenMenu> {
  Color _circleColor = AppColors.black;

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
                value: widget.toolboxState.strokeWidth,
                min: 1.0,
                max: 30.0,
                onChanged: (value) {
                  setState(() {
                    widget.toolboxState.strokeWidth = value;
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
