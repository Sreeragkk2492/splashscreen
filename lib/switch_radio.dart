import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Switch_Radio(),
  ));
}

class Switch_Radio extends StatefulWidget {
  const Switch_Radio({super.key});

  @override
  State<Switch_Radio> createState() => _Switch_RadioState();
}

class _Switch_RadioState extends State<Switch_Radio> {

  bool on1 =false;
  bool on2=false;
 var bg;

  int selecteditem=1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: Text("Switch and radio"),
      ),
      body: Center(
        child: Column(
          children: [
            Switch(
             // thumbIcon: ,
            // thumbColor: ,
              value: on1,
              onChanged: (bool value) {
                setState(() {
                on1=value;
                bg=Colors.green;
                
                });
              },
              activeColor: Colors.green,
            ),
              Switch(
             // thumbIcon: ,
            // thumbColor: ,
              value: on2,
              onChanged: (bool value1) {
                setState(() {
                on2=value1;
                bg=Colors.red;
                
                });
              },
              activeColor: Colors.red,
            ),
            ListTile(
              leading: Radio(value: 1, groupValue: selecteditem, onChanged: (value1){
               setState(() {
                  selecteditem=value1!;
               });
              }),
              title: Text("option 1"),
            ),
             ListTile(
              leading: Radio(value: 2, groupValue: selecteditem, onChanged: (value1){
                setState(() {
                   selecteditem=value1!;
                });
              }),
              title: Text("option 2"),
            ),
          ],
        ),
      ),
    );
  }
}
