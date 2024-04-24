import 'package:flutter/material.dart';

class Homehivepage extends StatelessWidget {
   String? uname;
   Homehivepage({super.key, this.uname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('welcome $uname'),),
    );
  }
}