import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class BoxWidget extends StatefulWidget {
  const BoxWidget(this.index, {super.key});

  final int index;
  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  String value = '';

  void _pressed(int index) {
    setState(() {
      if (globals.xTurn && globals.displayElement[index] == '') {
        globals.displayElement[index] = 'X';
        globals.filledBoxes++;
        globals.xTurn = !globals.xTurn;
      } else if (!globals.xTurn && globals.displayElement[index] == '') {
        globals.displayElement[index] = 'O';
        globals.filledBoxes++;
        globals.xTurn = !globals.xTurn;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _pressed(widget.index),
        child: Center(
          child: Text(
            globals.displayElement[widget.index],
            style: const TextStyle(color: Colors.blue, fontSize: 200),
          ),
        ));
  }
}
