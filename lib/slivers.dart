import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    home: Sliverexample(),
    debugShowCheckedModeBanner: false,
  ));
}

class Sliverexample extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/wall.jpg",fit: BoxFit.cover,),
            ),
            pinned: true,
            floating: false, 
            elevation: 10,
            title: Text("sliverappbar"),

          ),
          SliverList(delegate: SliverChildBuilderDelegate(childCount: 30,(context, index) => Card(
            child: Center(
              child: Text('hii'),
            ),
          ))),
          SliverGrid(delegate: SliverChildBuilderDelegate((context, index) => Container(
            color: Colors.blue,
            width: double.infinity,
          )), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5,mainAxisSpacing: 5,crossAxisSpacing: 5)),
        ],
      ),
    );
  }
}