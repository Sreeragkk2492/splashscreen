import 'package:flutter/material.dart';

class Girdview1 extends StatelessWidget {
  const Girdview1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gridview1"),
      ),
      body: GridView(
        
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 5,mainAxisSpacing: 5),
          children: List.generate(
            25,
            (index) => Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/image2.png"),fit: BoxFit.fill)),
             // color: Colors.amber,
            //  child: Image.asset("assets/images/image2.png"),
            ),
          )),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Girdview1(),
  ));
}
