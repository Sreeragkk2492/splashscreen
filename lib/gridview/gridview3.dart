import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Gridview3(),
  ));
}

class Gridview3 extends StatelessWidget {
  const Gridview3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gridview3"),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 120),
            itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/image2.png"),
                          fit: BoxFit.fill)),
                )));
  }
}
