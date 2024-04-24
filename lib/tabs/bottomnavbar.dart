import 'package:flutter/material.dart';
import 'package:splashscreen/gridview/gridview6.dart';
import 'package:splashscreen/gridview/gridview7.dart';
import 'package:splashscreen/listview/listview5.dart';

class Bottomnavbar extends StatefulWidget {
  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {

  var index=0;
  List screens=[
    Gridview6(),
    Gridview7(),
    Listview5(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapindex){
           setState(() {
               index=tapindex;
           });
        },
        selectedItemColor: Colors.black,
        currentIndex: index,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'menu'),
       
      ]),
      body: screens[index],

    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Bottomnavbar(),
    debugShowCheckedModeBanner: false,
  ));
}
