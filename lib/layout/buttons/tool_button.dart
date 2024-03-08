import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';
import 'package:shareboard/toolbox_state.dart';

import '../../utils/image_constant.dart';
import 'color_button.dart';

class ToolButton extends StatefulWidget {
  const ToolButton({
    Key? key,
    required this.toolType,
    this.imagePath,
    required this.padding,
    required this.width,
    required this.height,
    this.popup,
    this.onTap,
  }) : super(key: key);

  final ToolType toolType;
  final String? imagePath;
  final double padding;
  final double width;
  final double height;
  final Widget? popup;
  final VoidCallback? onTap;

  @override
  State<ToolButton> createState() => _ToolButtonState();
}

class _ToolButtonState extends State<ToolButton> {
  @override
  Widget build(BuildContext context) {
    final toolboxState = Provider.of<ToolboxState>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding), // Adjust horizontal padding
      child: GestureDetector(
        onTap: () {
          print('Tapped on $widget.imagePath');
          if (toolboxState.toolType != widget.toolType && widget.toolType != ToolType.none) {
            widget.onTap!();
            if (toolboxState.toolType == ToolType.shapes) {
              showPopover(
                context: context,
                bodyBuilder: (context) => widget.popup!,
                width: 180,
                barrierColor: Colors.transparent,
              );
            }
          } else if (widget.popup != null) {
            showPopover(
              context: context,
              bodyBuilder: (context) => widget.popup!,
              width: 180,
              barrierColor: Colors.transparent,
            );
          }
        },
        child: SizedBox(
          height: 80,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                  height: 80,
                  child: widget.imagePath != null ?
                  Image.asset(widget.imagePath!, width: widget.width, height: widget.height) :
                      ColorTool(selectedColor: toolboxState.toolColor)
              ),
              Positioned(
                bottom: 6,
                child: (toolboxState.toolType != ToolType.none && toolboxState.toolType == widget.toolType) ?
                Image.asset(ImageConstant.imgShadow, width: 40, height: 10) :
                const SizedBox(width: 0, height: 0,)
              ),
            ],
          ),
        ),
      ), // Adjust initial size of image
    );
  }
}