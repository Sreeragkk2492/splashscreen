

import 'package:flutter/material.dart';
import 'package:splashscreen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gottohome();
  }
  @override
  Widget build(BuildContext context) {
     return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/splash_screen.jpg'),
            fit: BoxFit.cover)),
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.2)
              ],
              begin: Alignment.bottomRight,
              stops: [0.3, 0.9])),
    ),
  );
  }

  Future <void> gottohome() async{
  await Future.delayed(Duration(seconds: 3));

 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login()));

}
}

