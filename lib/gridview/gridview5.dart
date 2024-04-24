import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Gridview5() ,
  ));
}

class Gridview5 extends StatelessWidget {
  const Gridview5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("gridview5"),),
      body: GridView.count(crossAxisCount: 5,children: List.generate(15, (index) => Container(
        color: Colors.blue,
        child: Image.asset("assets/images/image2.png"),
      )),mainAxisSpacing: 5,crossAxisSpacing: 5,),
    );
  }
}