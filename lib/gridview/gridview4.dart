import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Gridview4(),
  ));
}

class Gridview4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gridview4"),
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (context, index) =>Card(
            child: ListTile(
              leading: Image.asset("assets/images/wall.jpg"),
            ),
          ),
    ));
  }
}
