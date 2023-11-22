import 'package:flutter/material.dart';

class BoxWidget extends StatefulWidget {
  final String text;
  const BoxWidget(this.text);

  @override
  State<BoxWidget> createState() => _BoxWidgetState('');
}

class _BoxWidgetState extends State<BoxWidget> {
  String text;
  bool pressed = false;
  _BoxWidgetState(this.text);

  String value = '';
  List<String> values = ['X', 'O'];
  int count = 0;
  void toggleDraw() {
    setState(() {
      if (pressed == false) {
        text = values[0];
        pressed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: ElevatedButton(
          onPressed: toggleDraw,
          child: SizedBox(
              height: 300, width: 300, child: Center(child: Text(text)))),
    );
  }
}
