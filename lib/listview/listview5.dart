import 'package:flutter/material.dart';

class Listview5 extends StatelessWidget {

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
        title: Text("lisviewcustom"),
      ),
    //   body: ListView.custom(childrenDelegate: SliverChildListDelegate(List.generate(30, (index) => Card(
    //     elevation: 10,
    //     color: Colors.blue,
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Text("name"),
    //     ),
    //   ))),
    // )
    body: ListView.custom(childrenDelegate: SliverChildBuilderDelegate((context, index) => Card(
      color: Colors.blue.shade600,
      elevation: 10,
      child: ListTile(
        leading: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/splash_screen.jpg"),fit: BoxFit.cover)),),
      ),
    )),),
    );
  }
}

void main(){
  runApp(MaterialApp(home: Listview5(),debugShowCheckedModeBanner: false,));
}