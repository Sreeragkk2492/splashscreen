import 'package:flutter/material.dart';

class Screen_stateless extends StatelessWidget {
  String name;
  String? studentname;
   Screen_stateless({super.key,required this.name,this.studentname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("welcome to $name"),
            SizedBox(height: 10,),
            Text("hi $studentname"),
          ],
        ),
      ),
    );
  }
}