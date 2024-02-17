import 'package:flutter/material.dart';

class shapesMenu extends StatefulWidget {
  const shapesMenu({super.key});

  @override
  State<shapesMenu> createState() => _shapesMenuState();
}

class _shapesMenuState extends State<shapesMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          // line, arrow, arc
          Container(
            alignment: Alignment.center,
            height: 40,
            child: Text('line, arrow, arc'),
          ),
          // square, circle, triangle
          Container(
            alignment: Alignment.center,
            height: 40,
            child: Text('square, circle, triangle',
                overflow: TextOverflow.ellipsis,),
          )
        ],
      ),
    );
  }
}
