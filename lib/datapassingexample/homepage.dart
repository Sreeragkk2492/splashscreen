import 'package:flutter/material.dart';

class Homepagee extends StatelessWidget {
  String? username;
   Homepagee({super.key,this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("welcome $username"),
      ),
    );
  }
}