import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/firebase_database/email_password_auth/home_page.dart';
import 'package:splashscreen/firebase_database/email_password_auth/login_page.dart';

void main() async {

  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDzoXrzGuOtX9q4D5HaACgmPZQqd_qc98U",
          appId: "1:962969812983:android:6632537d72d18bb2eb38f2",
          messagingSenderId: "",
          projectId: "mygsignin-f7f9c"));
          User? user=FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    
    debugShowCheckedModeBanner: false,
    home:user==null? Fire_splash():Fire_home(),
  ));
}

class Fire_splash extends StatefulWidget {
  const Fire_splash({super.key});

  @override
  State<Fire_splash> createState() => _Fire_splashState();
}

class _Fire_splashState extends State<Fire_splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login_page()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/gif1.gif'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
