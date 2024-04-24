import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Hero_animation(),
  ));
}

class Hero_animation extends StatelessWidget {
  const Hero_animation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hero animation"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Herodetails()));
          },
          child: Hero(
              tag: 'imageHero',
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pinkAccent,
                ),
                width: 300,
                height: 300,
                child: Icon(
                  Icons.widgets_outlined,
                  size: 50,
                ),
              )),
        ),
      ),
    );
  }
}

class Herodetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("herodetails"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Hero_animation()));
          },
          child: Hero(
              tag: 'imageHero',
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyanAccent),
                    width: 500,
                    height: 500,
                    child: Icon(Icons.filter_vintage_outlined,size: 50,color: Colors.purpleAccent,),
              )),
        ),
      ),
    );
  }
}
