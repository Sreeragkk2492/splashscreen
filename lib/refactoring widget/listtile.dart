import 'package:flutter/material.dart';
import 'package:splashscreen/refactoring%20widget/widgets/shoeswidget.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Listtilepage(),
  ));
}

class Listtilepage extends StatelessWidget {
 
   Listtilepage({super.key});

   var name=[
     ' Nike Air Force',
    'Air Jordan',
    'Nike Air Max',
    'Nike Air Yeezy',
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('nike brands'),
      ),
      body: ListView.builder(
        itemCount: name.length ,
          itemBuilder: (context, int) => Shoeswidget(
              leadinimage: AssetImage('assets/images/wall.jpg'),
            title: 'nike',
              subtitle: '\$500')),
    );
  }
}
