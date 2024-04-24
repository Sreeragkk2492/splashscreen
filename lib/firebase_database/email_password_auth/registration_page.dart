import 'package:flutter/material.dart';
import 'package:splashscreen/firebase_database/email_password_auth/firebase_functions.dart';
import 'package:splashscreen/firebase_database/email_password_auth/login_page.dart';

class Fire_Register extends StatelessWidget {
  Fire_Register({super.key});

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Registration page'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    helperText: 'enter your email',
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                    helperText: 'enter your password',
                    border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  String email = emailcontroller.text.trim();
                  String password = passwordcontroller.text.trim();
                  FireBaseFunction()
                      .registeruser(email: email, password: password)
                      .then((response) {
                    if (response == null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Login_page()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(response)));
                    }
                  });
                },
                child: Text('register')),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Login_page()));
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Already have account?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ]),
                ))
          ],
        ),
      ),
    );
  }
}
