import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/gridview/gridview4.dart';
import 'package:splashscreen/listview/listview4.dart';



void main(){
  runApp(MaterialApp(
    home: Expanded1(),
    debugShowCheckedModeBanner: false,
  ));
}

class Expanded1 extends StatefulWidget {
  @override
  State<Expanded1> createState() => _Expanded1State();
}

class _Expanded1State extends State<Expanded1> {
  var index=0;

  var screens=[
    Gridview4(),
    Expanded1(),
    Listview4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("expanded widget"),
      ),
      bottomNavigationBar: ConvexAppBar(
        onTap: (ontap){
          setState(() {
            index=ontap;
          });
        },
        
        backgroundColor: Colors.black,
        items: [TabItem(icon: Icons.settings,title: 'settings'),
      TabItem(icon: Icons.home,title: 'home'),
      TabItem(icon: Icons.history,title: 'history'),]),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.cyanAccent,
            ),
          )
        ],
      ),
    );
  }
}