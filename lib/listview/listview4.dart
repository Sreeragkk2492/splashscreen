import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:splashscreen/listview/listview.dart';

class Listview4 extends StatelessWidget {
  var icons = [
    Icon(Icons.abc_outlined,color: Colors.white,),
    Icon(Icons.ac_unit_sharp,color: Colors.white,),
    Icon(Icons.access_time_outlined,color: Colors.white,),
    Icon(Icons.add_a_photo,color: Colors.white,),
    Icon(Icons.zoom_out_map_sharp,color: Colors.white,),
    Icon(Icons.abc_outlined,color: Colors.white,),
    Icon(Icons.ac_unit_sharp,color: Colors.white,),
    Icon(Icons.access_time_outlined,color: Colors.white,),
    Icon(Icons.add_a_photo,color: Colors.white,),
    Icon(Icons.zoom_out_map_sharp,color: Colors.white,),
    Icon(Icons.abc_outlined,color: Colors.white,),
    Icon(Icons.ac_unit_sharp,color: Colors.white,),
  ];

  var months=[
      'january',
    'february',
    'march',
    'april',
    'may',
    'june',
    'july',
    'august',
    'september',
    'october',
    'november',
    'december'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("listviewseperator"),
      ),
      body: ListView.separated(
      
          itemBuilder: (context, index) => Card(
                elevation: 10,
                shadowColor: Colors.blue,
                child: ListTile(
                  
                  tileColor: Colors.lightBlue,
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/image2.png"),
                  ),
                  trailing: icons[index],
                  title: Text(months[index]),
                ),
              ),
          separatorBuilder: (context, index) {
            if(index%4==0){
            return Card(
              
              elevation: 10,
              shadowColor: Colors.red,
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("advertisement"),
              ),
            );
          }else{
            return SizedBox();
          }
          },
          itemCount: icons.length),
    );
  }

 
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
    home: Listview4(),
    debugShowCheckedModeBanner: false,
  ));
}
