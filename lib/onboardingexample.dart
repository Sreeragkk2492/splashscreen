import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:splashscreen/signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OnboardingExample(),
  ));
}

class OnboardingExample extends StatelessWidget {
  const OnboardingExample({super.key});

  @override
  Widget build(BuildContext context) {
    PageDecoration page_decor = PageDecoration(
        bodyTextStyle: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        bodyPadding: EdgeInsets.all(25),
        imagePadding: EdgeInsets.only(right: 15,left: 15),
        boxDecoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 250, 91, 144), Color.fromARGB(255, 235, 150, 54),],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomCenter)));
    return IntroductionScreen(
      dotsDecorator: DotsDecorator(
          color: Colors.white,
          activeColor: Colors.red,
          activeSize: Size(30, 15),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      globalBackgroundColor: Colors.black,
      next: Icon(
        Icons.arrow_forward,
        color: Colors.red,
      ),
      showSkipButton: true,
      skip: Text(
        "skip",
        style: TextStyle(color: Colors.red),
      ),
      done: Text("done"),
      onDone: () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Signup()));
      },
      pages: [
        PageViewModel(
          decoration: page_decor,
          //  title: 'Page 1',
          titleWidget: Text(
            "page 1",
            style: TextStyle(color: Colors.white),
          ),
          //  body: 'this is page 1',
          bodyWidget: Text(
            "this is page 1",
            style: TextStyle(color: Colors.white),
          ),
          image: Image.asset('assets/images/wall.jpg'),
        ),
        PageViewModel(
          decoration: page_decor,
          //  title: 'Page 2',
          titleWidget: Text(
            "page 2",
            style: TextStyle(color: Colors.white),
          ),
          //  body: 'this is page 2',
          bodyWidget: Text(
            "this is page 2",
            style: TextStyle(color: Colors.white),
          ),
          image: Image.asset('assets/images/wall.jpg'),
        ),
        PageViewModel(
          decoration: page_decor,
          //  title: 'Page 3',
          titleWidget: Text(
            "page 3",
            style: TextStyle(color: Colors.white),
          ),
          //  body: 'this is page 3',
          bodyWidget: Text(
            "this is page 3",
            style: TextStyle(color: Colors.white),
          ),
          image: Image.asset('assets/images/wall.jpg'),
        ),
      ],
    );
  }
}
