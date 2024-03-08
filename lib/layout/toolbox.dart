import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareboard/layout/buttons/tool_button.dart';
import 'package:shareboard/utils/app_colors.dart';
import 'package:shareboard/utils/image_constant.dart';

import 'popups/color_picker_menu.dart';
import 'popups/eraser_menu.dart';
import 'popups/more_menu.dart';
import 'popups/pen_menu.dart';
import 'popups/shapes_menu.dart';
import 'popups/textbox_menu.dart';

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildToolButtons(context),
          ),
        ));
  }

  List<Widget> _buildToolButtons(BuildContext context) {
    final toolboxState = Provider.of<ToolboxState>(context);
    return [
      ToolButton(
        toolType: ToolType.none,
        imagePath: ImageConstant.imgUndo,
        padding: 10.0,
        width: 30,
        height: 30,
      ),
      ToolButton(
        toolType: ToolType.none,
        imagePath: ImageConstant.imgRedo,
        padding: 3.0,
        width: 30,
        height: 30,
      ),
      ToolButton(
        toolType: ToolType.pen,
        imagePath: ImageConstant.imgPen,
        padding: 5.0,
        width: 55,
        height: 55,
        popup: PenMenu(toolboxState: toolboxState),
        onTap: () {
          setState(() {
            toolboxState.toolType = ToolType.pen;
          });
        },
      ),
      ToolButton(
        toolType: ToolType.eraser,
        imagePath: ImageConstant.imgEraser,
        padding: 5.0,
        width: 50,
        height: 50,
        popup: eraserMenu(),
        onTap: () {
          setState(() {
            toolboxState.toolType = ToolType.eraser;
          });
        },
      ),
      ToolButton(
        toolType: ToolType.highlighter,
        imagePath: ImageConstant.imgHighlighter,
        padding: 5.0,
        width: 55,
        height: 55,
        popup: PenMenu(toolboxState: toolboxState),
        onTap: () {
          setState(() {
            toolboxState.toolType = ToolType.highlighter;
          });
        },
      ),
      ToolButton(
        toolType: ToolType.shapes,
        imagePath: ImageConstant.imgShapes,
        padding: 3.0,
        width: 60,
        height: 60,
        popup: shapesMenu(),
        onTap: () {
          setState(() {
            toolboxState.toolType = ToolType.shapes;
          });
        },
      ),
      ToolButton(
        toolType: ToolType.textBox,
        imagePath: ImageConstant.imgTextbox,
        padding: 0.0,
        width: 62,
        height: 62,
        popup: textboxMenu(),
        onTap: () {
          setState(() {
            toolboxState.toolType = ToolType.textBox;
          });
        },
      ),
      ToolButton(
        toolType: ToolType.none,
        padding: 12.0,
        width: 50,
        height: 50,
        popup: ColorPickerMenu(toolboxState: toolboxState),
      ),
      ToolButton(
        toolType: ToolType.none,
        imagePath: ImageConstant.imgMore,
        padding: 10.0,
        width: 45,
        height: 45,
        popup: moreMenu(),
      ),
    ];
  }
}


