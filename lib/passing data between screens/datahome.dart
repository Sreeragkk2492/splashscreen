import 'package:flutter/material.dart';
import 'package:splashscreen/passing%20data%20between%20screens/statefulpage.dart';
import 'package:splashscreen/passing%20data%20between%20screens/statelesspage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Datahome(),
  ));
}

class Datahome extends StatelessWidget {
 String name='luminar';
 String studentname='sreerag';
 String? location;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen_stateless(name:name,studentname:studentname)));
            }, child: Text("to stateless page")),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen_stateful(studentname:studentname,location:"kannur")));
            }, child: Text("to stateful page")),
          ],
        ),
      ),
    );
  }
}