import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: Counterapp(),
    debugShowCheckedModeBanner: false,
  ));
}

class Counterapp extends StatefulWidget {
  const Counterapp({super.key});

  @override
  State<Counterapp> createState() => _CounterappState();
}

class _CounterappState extends State<Counterapp> {

  int count=0;
  bool bulbicon=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("counter app"),
      ),
      body: Center(
        child: Text(count.toString(),style: TextStyle(fontSize: 25),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
      setState(() {
        count++;
        if(bulbicon){
          bulbicon=false;
        }else{
          bulbicon=true;
        }
      });
      },child:Icon( bulbicon?Icons.lightbulb :Icons.lightbulb_outline_rounded)),
    );
  }
}