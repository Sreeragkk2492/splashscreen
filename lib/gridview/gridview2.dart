import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Gridview2(),
  ));
}

class Gridview2 extends StatelessWidget {
  
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gridview2"),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            maxCrossAxisExtent: 120,
          ),
          children: List.generate(
           icons.length,
            (index) => Container(
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage(),
              //         fit: BoxFit.fill)),
               color: Colors.amber,
               child: icons[index],
            ),
          ),
        ));
  }
}
