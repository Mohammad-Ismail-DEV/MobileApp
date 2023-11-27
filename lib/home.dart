import 'package:flutter/material.dart';
import 'package:project/box.dart';
import 'globals.dart' as globals;

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    globals.notify.addListener(() {
      setState(() {
        globals.notify.value = true;
        globals.displayElement = ['', '', '', '', '', '', '', '', ''];
        globals.filledBoxes = 0;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play X-O'),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          width: MediaQuery.of(context).size.height - 100,
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blue)),
                    child: Center(
                      child: BoxWidget(
                        index,
                      ),
                    ),
                  );
                }),
          )),
    );
  }
}
