import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Gridview7(),
  ));
}

class Gridview7 extends StatelessWidget {
  const Gridview7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.custom(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          childrenDelegate:
              SliverChildListDelegate(List.generate(10, (index) => Container(
                color: Colors.amberAccent,
                child: Image.asset("assets/images/image2.png"),
              )))),
      ),
    );
  }
}
