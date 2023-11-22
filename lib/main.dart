import 'package:flutter/material.dart';
import 'package:project/box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
        ),
        body: SizedBox(
          height: 300,
          width: 300,
          child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 3,
              // Generate 100 widgets that display their index in the List.
              children: [
                BoxWidget("O"),
                BoxWidget("x"),
                BoxWidget("x"),
                BoxWidget("x"),
                BoxWidget("x"),
                BoxWidget("x"),
                BoxWidget("x"),
                BoxWidget("x"),
                BoxWidget("x"),
              ]),
        ));
  }
}
