import 'package:flutter/material.dart';
import 'package:splashscreen/localstorage/shares_prefs/welcome.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Sharedsplash(),
  ));
}

class Sharedsplash extends StatefulWidget {
  const Sharedsplash({super.key});

  @override
  State<Sharedsplash> createState() => _SharedsplashState();
}

class _SharedsplashState extends State<Sharedsplash> {

  @override
  void initState() {
   gotowelcomepage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('splash',style: TextStyle(fontSize: 30),),
      ),
    );
  }
  
Future  <void> gotowelcomepage() async{
  await Future.delayed(Duration(seconds: 2));
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WelcomeScreen()));
}
}