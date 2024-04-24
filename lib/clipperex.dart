import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClipperEx(),
  ));
}

class ClipperEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("clippers"),
      ),
      body: ListView(
        children: [
          ClipRect(
            child: Align(
              widthFactor: .6,
              heightFactor: .5,
              child: Image.asset("assets/images/wall.jpg"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset("assets/images/wall.jpg"),
          ),
          SizedBox(
            height: 20,
          ),
          ClipOval(
            child: Image.asset("assets/images/wall.jpg"),
          ),
          ClipPath(
            clipper: MessageClipper(),
            child: Container(
              color: Colors.blue,
              height: 200,
            ),
          ),
          ClipPath(
            clipper: MovieTicketBothSidesClipper(),
            child: Container(
              color: Colors.amberAccent,
              height: 200,
            ),
          ),
          ClipPath(
            clipper: StarClipper(5),
            child: Container(
              color: Colors.cyanAccent,
              height: 700,
            ),
          ),
        ],
      ),
    );
  }
}
