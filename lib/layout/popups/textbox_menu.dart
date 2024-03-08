import 'package:flutter/material.dart';

import '../../utils/image_constant.dart';
import '../buttons/align_button.dart';
import '../buttons/font_button.dart';

class textboxMenu extends StatefulWidget {
  const textboxMenu({super.key});

  @override
  State<textboxMenu> createState() => _textboxMenuState();
}

class _textboxMenuState extends State<textboxMenu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildSizeChanger(),
          FittedBox(
            fit: BoxFit.fill,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFontChanger(),
                SizedBox(
                  width: 25,
                  height: 45,
                  child: Text(
                    '|',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildAlignmentChanger(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSizeChanger() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          Text(
            "Size:",
            style: TextStyle(
              fontSize: 15.0,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10), // Add some spacing between the Text and TextField
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 8.0),
                ),
                controller: TextEditingController()..text = '12',
                onChanged: (text) => {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFontChanger() {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          fontButton(
            imagePath: ImageConstant.imgBold,
          ),
          fontButton(
            imagePath: ImageConstant.imgItalic,
          ),
          fontButton(
            imagePath: ImageConstant.imgUnderline,
          ),
        ],
      ),
    );
  }

  Widget _buildAlignmentChanger() {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          alignButton(
            imagePath: ImageConstant.imgAlignLeft,
            index: 0,
            selectedIndex: _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = 0;
              });
            },
          ),
          alignButton(
            imagePath: ImageConstant.imgAlignCenter,
            index: 1,
            selectedIndex: _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
          ),
          alignButton(
            imagePath: ImageConstant.imgAlignRight,
            index: 2,
            selectedIndex: _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
          ),
        ],
      ),
    );
  }
}