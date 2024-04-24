import 'package:flutter/material.dart';

class ListviewBuilder extends StatelessWidget {
 

 var name = [
    'a1',
    'c1',
    'd1',
    'e1',
    'a1',
    'c1',
    'd1',
    'e1',
    'a1',
    'c1',
    'd1',
    'e1'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("listviewBuilder"),
      ),
      body: ListView.builder(itemBuilder: (context,index)=>Card(
        child: Text(name[index]),
      ),itemCount: name.length,),
    );
  }
}

void main(){
  runApp(MaterialApp(home: ListviewBuilder(),debugShowCheckedModeBanner: false,));
}