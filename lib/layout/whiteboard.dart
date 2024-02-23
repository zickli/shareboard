import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareboard/drawing_widget.dart';
import 'package:shareboard/layout/toolbox.dart';
import 'package:shareboard/toolbox_state.dart';

class Whiteboard extends StatelessWidget {
  const Whiteboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToolboxState>(
      create: (_) => ToolboxState(),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            DrawingWidget(),
            Positioned(
              bottom: 20,
              child: Toolbox(),
            ),
          ],
        );
      });
  }
}
