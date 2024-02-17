import 'package:flutter/material.dart';
import 'package:shareboard/layout/eraser_menu.dart';
import 'package:shareboard/layout/marker_menu.dart';
import 'package:shareboard/layout/more_menu.dart';
import 'package:shareboard/layout/pen_menu.dart';
import 'package:shareboard/layout/shapes_menu.dart';
import 'package:shareboard/layout/tectbox_menu.dart';
import 'package:shareboard/layout/tool_button.dart';
import 'package:shareboard/utils/app_colors.dart';
import 'package:shareboard/utils/image_constant.dart';

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
                offset: Offset(5, 5),
                blurRadius: 10,
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildToolButtons(),
          ),
        )
    );
  }

  List<Widget> _buildToolButtons() {
    return [
      toolButton(
        imagePath: ImageConstant.imgUndo,
        padding: 2.0,
        width: 30,
        height: 30,
      ),
      toolButton(
        imagePath: ImageConstant.imgRedo,
        padding: 2.0,
        width: 30,
        height: 30,
      ),
      toolButton(
        imagePath: ImageConstant.imgPen,
        padding: 5.0,
        width: 55,
        height: 55,
        popup: const penMenu(),
      ),
      toolButton(
        imagePath: ImageConstant.imgEraser,
        padding: 5.0,
        width: 50,
        height: 50,
        popup: eraserMenu(),
      ),
      toolButton(
        imagePath: ImageConstant.imgMarker,
        padding: 5.0,
        width: 55,
        height: 55,
        popup: markerMenu(),
      ),
      toolButton(
        imagePath: ImageConstant.imgShapes,
        padding: 5.0,
        width: 60,
        height: 60,
        popup: shapesMenu(),
      ),
      toolButton(
        imagePath: ImageConstant.imgTextbox,
        padding: 5.0,
        width: 60,
        height: 60,
        popup: textboxMenu(),
      ),
      toolButton(
        imagePath: ImageConstant.imgMore,
        padding: 5.0,
        width: 30,
        height: 30,
        popup: moreMenu(),
      ),
    ];
  }
}


