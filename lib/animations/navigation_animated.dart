import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Navigation_animated(),
  ));
}

class Navigation_animated extends StatelessWidget {
  const Navigation_animated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mainpage'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(seconds: 2),
                        pageBuilder: (context, anim1, anim2) => Second_page(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end);
                          final offsetAnimation = animation.drive(tween);
                          final curvedAnimation = CurvedAnimation(
                            parent: animation,
                            curve: Curves.fastLinearToSlowEaseIn,
                          );

                          return SlideTransition(
                            position: tween.animate(curvedAnimation),
                            child: child,
                          );
                        },
                      ));
                },
                child: Text('slide transition')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          transitionsBuilder: (context, a1, a2, child) =>
                              FadeTransition(
                                opacity: a1,
                                child: child,
                              ),
                          pageBuilder: (context, a1, a2) => Second_page()));
                },
                child: Text('fade transition')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          transitionsBuilder: (context, an1, an2, child) =>
                              ScaleTransition(
                                scale: an1,
                                child: child,
                              ),
                          pageBuilder: (context, an1, an2) => Second_page()));
                },
                child: Text('scale tarnsition')),
          ],
        ),
      ),
    );
  }
}

class Second_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Navigation_animated()));
            },
            child: Text('go back')),
      ),
    );
  }
}
