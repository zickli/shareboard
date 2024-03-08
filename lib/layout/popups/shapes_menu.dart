import 'package:flutter/material.dart';

import '../../utils/image_constant.dart';
import '../buttons/shape_button.dart';

class shapesMenu extends StatefulWidget {
  const shapesMenu({super.key});

  @override
  State<shapesMenu> createState() => _shapesMenuState();
}

class _shapesMenuState extends State<shapesMenu> {
  @override
  Widget build(BuildContext context) {
    return _buildMenuButtons();
  }

  Widget _buildMenuButtons() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  shapeButton(
                    imagePath: ImageConstant.imgLine,
                  ),
                  shapeButton(
                    imagePath: ImageConstant.imgArrow,
                  ),
                  shapeButton(
                    imagePath: ImageConstant.imgArc,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  shapeButton(
                    imagePath: ImageConstant.imgSquare,
                  ),
                  shapeButton(
                    imagePath: ImageConstant.imgCircle,
                  ),
                  shapeButton(
                    imagePath: ImageConstant.imgTriangle,
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
