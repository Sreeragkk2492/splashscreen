import 'package:flutter/material.dart';
import 'package:splashscreen/main.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget{

 
  @override
  Widget build(BuildContext context) {
     bool isDarktheme=MediaQuery.of(context).platformBrightness==Brightness.dark;
  return MaterialApp(
    theme: isDarktheme?ThemeData.light():ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: Screen_orientation(),
  );
  }

}

class Screen_orientation extends StatelessWidget {
  var orientation, height, Width;

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    height = MediaQuery.of(context).size.height;
    Width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('mediaquery'),
        ),
        body: orientation == Orientation.portrait
            ? Container(
                color: Colors.red,
                height: height / 2,
                width: Width / 2,
              )
            : Container(
                color: Colors.blue,
                height: height / 2,
                width: Width / 2,
              ));
  }
}
