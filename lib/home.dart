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
