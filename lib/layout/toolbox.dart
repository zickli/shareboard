import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareboard/layout/eraser_menu.dart';
import 'package:shareboard/layout/marker_menu.dart';
import 'package:shareboard/layout/more_menu.dart';
import 'package:shareboard/layout/pen_menu.dart';
import 'package:shareboard/layout/shapes_menu.dart';
import 'package:shareboard/layout/tectbox_menu.dart';
import 'package:shareboard/layout/tool_button.dart';
import 'package:shareboard/utils/app_colors.dart';
import 'package:shareboard/utils/image_constant.dart';

import 'package:shareboard/toolbox_state.dart';

class Toolbox extends StatefulWidget {
  const Toolbox({super.key});

  @override
  State<Toolbox> createState() => _ToolboxState();
}

class _ToolboxState extends State<Toolbox> {
  @override
  Widget build(BuildContext context) {
    return _buildToolbox(context);
  }

  Widget _buildToolbox(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 600,
        height: 80,
        decoration: BoxDecoration(
            color: AppColors.gray7E7,
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.gray617.withOpacity(0.2),
                offset: const Offset(5, 5),
                blurRadius: 10,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildToolButtons(context),
          ),
        ));
  }

  List<Widget> _buildToolButtons(BuildContext context) {
    final toolboxState = Provider.of<ToolboxState>(context);
    return [
      ToolButton(
        imagePath: ImageConstant.imgUndo,
        padding: 2.0,
        width: 30,
        height: 30,
      ),
      ToolButton(
        imagePath: ImageConstant.imgRedo,
        padding: 2.0,
        width: 30,
        height: 30,
      ),
      ToolButton(
        imagePath: ImageConstant.imgPen,
        padding: 5.0,
        width: 55,
        height: 55,
        popup: PenMenu(toolboxState: toolboxState),
      ),
      ToolButton(
        imagePath: ImageConstant.imgEraser,
        padding: 5.0,
        width: 50,
        height: 50,
        popup: eraserMenu(),
      ),
      ToolButton(
        imagePath: ImageConstant.imgMarker,
        padding: 5.0,
        width: 55,
        height: 55,
        popup: markerMenu(),
      ),
      ToolButton(
        imagePath: ImageConstant.imgShapes,
        padding: 5.0,
        width: 60,
        height: 60,
        popup: shapesMenu(),
      ),
      ToolButton(
        imagePath: ImageConstant.imgTextbox,
        padding: 5.0,
        width: 60,
        height: 60,
        popup: textboxMenu(),
      ),
      ToolButton(
        imagePath: ImageConstant.imgMore,
        padding: 5.0,
        width: 30,
        height: 30,
        popup: moreMenu(),
      ),
    ];
  }
}
