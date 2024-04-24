import 'package:flutter/material.dart';
import 'package:splashscreen/listview/listview.dart';

class ListviewGenerate extends StatelessWidget {
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
  var icons = [
    Icon(Icons.abc_outlined),
    Icon(Icons.ac_unit_sharp),
    Icon(Icons.access_time_outlined),
    Icon(Icons.add_a_photo),
    Icon(Icons.zoom_out_map_sharp),
     Icon(Icons.abc_outlined),
    Icon(Icons.ac_unit_sharp),
    Icon(Icons.access_time_outlined),
    Icon(Icons.add_a_photo),
    Icon(Icons.zoom_out_map_sharp),
      Icon(Icons.abc_outlined),
    Icon(Icons.ac_unit_sharp),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("listviewGenerator"),
        ),
        body: ListView(
          children: List.generate(
            name.length,
            (index) => Card(
              elevation: 10,
              child: ListTile(
                title: Text(name[index]),
                textColor: Colors.teal,
                trailing: icons[index],
              ),
            ),
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListviewGenerate(),
  ));
}
