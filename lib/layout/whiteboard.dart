import 'package:flutter/material.dart';
import 'package:shareboard/drawing_widget.dart';
import 'package:shareboard/layout/toolbox.dart';
import 'package:shareboard/utils/image_constant.dart';
import 'package:shareboard/utils/app_colors.dart';

class Whiteboard extends StatelessWidget {
  const Whiteboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              image: DecorationImage(
                image: AssetImage(
                  ImageConstant.dottedBackground,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const DrawingWidget(),
          const Positioned(
            bottom: 20,
            child: Toolbox(),
          ),
        ],
      ),
    );
  }
}
