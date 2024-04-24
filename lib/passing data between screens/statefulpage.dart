import 'package:flutter/material.dart';

class Screen_stateful extends StatefulWidget {
  String? studentname;
  String? location;
  Screen_stateful({super.key,  this.studentname,this.location});

  @override
  State<Screen_stateful> createState() => _Screen_statefulState();
}

class _Screen_statefulState extends State<Screen_stateful> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${widget.studentname},${widget.location}'),
      ),
    );
  }
}