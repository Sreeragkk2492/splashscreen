import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/localstorage/shares_prefs/home.dart';
import 'package:splashscreen/localstorage/shares_prefs/login.dart';
import 'package:splashscreen/localstorage/shares_prefs/registration.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late SharedPreferences prefs;

  late bool isANewuser;

  @override
  void initState() {
    checkuserlogedin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Share_register()));
                },
                child: Text('register')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ShareLogin_page()));
                },
                child: Text('login')),
          ],
        ),
      ),
    );
  }

  void checkuserlogedin() async {
    prefs = await SharedPreferences.getInstance();
    isANewuser = prefs.getBool('newuser') ?? true;
    if (isANewuser == false) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Sharerhomepage()));
    }
  }
}
