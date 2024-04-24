import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Gridview8(),
  ));
}

class Gridview8 extends StatelessWidget {
  const Gridview8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gridviewcustom"),
      ),
      body: GridView.custom(
        
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5,mainAxisSpacing: 5,crossAxisSpacing: 5),
          childrenDelegate:
              SliverChildBuilderDelegate((context, index) => Container(
                color: Colors.amber.shade600,
                child: Image.asset("assets/images/image2.png"),
              ),childCount: 10)),
    );
  }
}
