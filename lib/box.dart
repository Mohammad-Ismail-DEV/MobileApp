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

    _checkWinner();
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" $winner \" is Winner!!!"),
            actions: [
              ElevatedButton(
                child: const Text("Play Again"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Draw"),
            actions: [
              ElevatedButton(
                child: const Text("Play Again"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _checkWinner() {
    // Checking rows
    if (globals.displayElement[0] == globals.displayElement[1] &&
        globals.displayElement[0] == globals.displayElement[2] &&
        globals.displayElement[0] != '') {
      _showWinDialog(globals.displayElement[0]);
    }
    if (globals.displayElement[3] == globals.displayElement[4] &&
        globals.displayElement[3] == globals.displayElement[5] &&
        globals.displayElement[3] != '') {
      _showWinDialog(globals.displayElement[3]);
    }
    if (globals.displayElement[6] == globals.displayElement[7] &&
        globals.displayElement[6] == globals.displayElement[8] &&
        globals.displayElement[6] != '') {
      _showWinDialog(globals.displayElement[6]);
    }

    // Checking Column
    if (globals.displayElement[0] == globals.displayElement[3] &&
        globals.displayElement[0] == globals.displayElement[6] &&
        globals.displayElement[0] != '') {
      _showWinDialog(globals.displayElement[0]);
    }
    if (globals.displayElement[1] == globals.displayElement[4] &&
        globals.displayElement[1] == globals.displayElement[7] &&
        globals.displayElement[1] != '') {
      _showWinDialog(globals.displayElement[1]);
    }
    if (globals.displayElement[2] == globals.displayElement[5] &&
        globals.displayElement[2] == globals.displayElement[8] &&
        globals.displayElement[2] != '') {
      _showWinDialog(globals.displayElement[2]);
    }

    // Checking Diagonal
    if (globals.displayElement[0] == globals.displayElement[4] &&
        globals.displayElement[0] == globals.displayElement[8] &&
        globals.displayElement[0] != '') {
      _showWinDialog(globals.displayElement[0]);
    }
    if (globals.displayElement[2] == globals.displayElement[4] &&
        globals.displayElement[2] == globals.displayElement[6] &&
        globals.displayElement[2] != '') {
      _showWinDialog(globals.displayElement[2]);
    } else if (globals.filledBoxes == 9) {
      _showDrawDialog();
    }
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