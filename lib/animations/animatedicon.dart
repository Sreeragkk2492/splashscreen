import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Animationexample1(),
  ));
}
class Animationexample1 extends StatefulWidget {
  const Animationexample1({super.key});

  @override
  State<Animationexample1> createState() => _Animationexample1State();
}

class _Animationexample1State extends State<Animationexample1>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animatedicon'),
      ),
      body: Center(
        child: InkWell(
          onTap: () => startanimation(),
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause, 
            progress: animation,
            size: 75,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  startanimation() {
    if (animationController.isDismissed) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }
}
