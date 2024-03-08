import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shareboard/layout/buttons/color_button.dart';
import 'package:shareboard/utils/app_colors.dart';

import '../../toolbox_state.dart';

class ColorPickerMenu extends StatefulWidget {
  const ColorPickerMenu({super.key, required this.toolboxState});

  final ToolboxState toolboxState;

  @override
  State<ColorPickerMenu> createState() => _ColorPickerMenuState();
}

class _ColorPickerMenuState extends State<ColorPickerMenu> {
  static Color pickerColor = AppColors.defaultPickerColor;

  @override
  Widget build(BuildContext context) {
    return _buildColorPickerMenu(context);
  }

  Widget _buildColorPickerMenu(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120,
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildColors(context, AppColors.basicColors1),
              ),
            ),
            SizedBox(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildColors(context, AppColors.basicColors2),
              ),
            ),
            SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(AppColors.gray7E7),
                    foregroundColor: MaterialStatePropertyAll<Color>(AppColors.black),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          content: SizedBox(
                            width: 500,
                            height: 250,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: pickerColor,
                                  onColorChanged: changeColor,
                                ),
                              ),
                            )
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll<Color>(AppColors.gray7E7),
                                foregroundColor: MaterialStatePropertyAll<Color>(AppColors.black),
                              ),
                              child: const Text('Apply'),
                              onPressed: () {
                                setState(() {
                                  if (widget.toolboxState.toolType == ToolType.highlighter) {
                                    widget.toolboxState.toolColor = pickerColor.withAlpha(128);
                                  } else {
                                    widget.toolboxState.toolColor = pickerColor;
                                  }
                                });
                                Navigator.of(context).pop(); // pop the alertDialog
                                Navigator.of(context).pop(); // pop the color picker menu
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Customize'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  List<Widget> _buildColors(BuildContext context, List<Color> colors) {
    return [
      for (var color in colors)
        Padding(
            padding: const EdgeInsets.all(3.0),
            child: ColorButton(
                color: color,
                size: 30,
                onTap: () {
                  if (widget.toolboxState.toolType == ToolType.highlighter) {
                    widget.toolboxState.toolColor = color.withAlpha(128);
                  } else {
                    widget.toolboxState.toolColor = color;
                  }
                  Navigator.of(context).pop();
                })
        ),
    ];
  }
}