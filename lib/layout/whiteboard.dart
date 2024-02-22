import 'package:flutter/material.dart';
import 'package:shareboard/drawing_widget.dart';
import 'package:shareboard/layout/toolbox.dart';

class Whiteboard extends StatelessWidget {
  const Whiteboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        DrawingWidget(),
        Positioned(
          bottom: 20,
          child: Toolbox(),
        ),
      ],
    );
  }
}
