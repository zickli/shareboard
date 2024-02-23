import 'package:flutter/material.dart';
import 'package:shareboard/toolbox_state.dart';

class PenMenu extends StatefulWidget {
  const PenMenu({super.key, required this.toolboxState});

  final ToolboxState toolboxState;

  @override
  State<PenMenu> createState() => _PenMenuState();
}

class _PenMenuState extends State<PenMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child:
      Column(
        children: [
          // thickness changer
          Container(
            alignment: Alignment.center,
            height: 40,
            child: Slider(
              label: 'thickness',
              value: widget.toolboxState.strokeWidth,
              min: 10.0,
              max: 50.0,
              onChanged: (value) {
                setState(() {
                  widget.toolboxState.strokeWidth = value;
                });
              },),
          ),
          // color changer
          Container(
            alignment: Alignment.center,
            height: 40,
            child: const Text('thickness changer'),
          ),
        ],
      ),
    );
  }
}
