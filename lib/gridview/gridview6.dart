import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Gridview6() ,
  ));
}

class Gridview6 extends StatelessWidget {
  const Gridview6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gridview6"),
      ),
      body: GridView.extent(maxCrossAxisExtent: 220,children: List.generate(60, (index) => Container(
        color: Colors.blue,
        child: Image.asset("assets/images/image2.png"),
      )),mainAxisSpacing: 5,crossAxisSpacing: 5,),
    );
  }
}