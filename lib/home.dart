import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key, required String username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My home'),),
    );
  }
}