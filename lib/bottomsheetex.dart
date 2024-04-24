import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomSheetEx(),
  ));
}

class BottomSheetEx extends StatelessWidget {
  const BottomSheetEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bottomsheetexample"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            showbottomsheet(context);
          },
          child: Image.asset("assets/images/wall.jpg"),
        ),
      ),
    );
  }
  
  void showbottomsheet( BuildContext context) {
      showModalBottomSheet(backgroundColor: Colors.white,context: context, builder: (context)=>Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.share),
                trailing: Text("share"),
              ),
                ListTile(
                leading: Icon(Icons.copy),
                trailing: Text("copy"),
              ),
            ],
          ));
  }
}