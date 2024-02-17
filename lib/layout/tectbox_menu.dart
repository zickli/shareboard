import 'package:flutter/material.dart';

class textboxMenu extends StatefulWidget {
  const textboxMenu({super.key});

  @override
  State<textboxMenu> createState() => _textboxMenuState();
}

class _textboxMenuState extends State<textboxMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          // font/size changer
          Container(
            alignment: Alignment.center,
            height: 40,
            child: Text('font/size changer'),
          ),
          // color changer
          Container(
            alignment: Alignment.center,
            height: 40,
            child: Text('color changer'),
          )
        ],
      ),
    );
  }
}
