import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/gridview/gridview6.dart';

import '../gridview/gridview7.dart';
import '../listview/listview5.dart';

class Convexexample extends StatefulWidget {
  const Convexexample({super.key});

  @override
  State<Convexexample> createState() => _ConvexexampleState();
}

class _ConvexexampleState extends State<Convexexample> {
  var index=0;
   List screens=[
    Gridview6(),
    Gridview7(),
    Listview5(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar( 
        backgroundColor: Colors.white, 
        activeColor: Colors.red,
        shadowColor: Colors.blueGrey,
        onTap: (ontapindex){
          setState(() {
            index=ontapindex;
          });
        },
        
          items: [TabItem(icon: Icon(Icons.search), title: 'search'),
          TabItem(icon: Icon(Icons.home),title: 'home'),
          TabItem(icon: Icons.settings,title: 'settings'),]),
          body: screens[index],
    );
  }
}

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Convexexample(),
  ));
}
