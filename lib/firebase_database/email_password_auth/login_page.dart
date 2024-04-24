import 'package:flutter/material.dart';
import 'package:splashscreen/firebase_database/email_password_auth/firebase_functions.dart';
import 'package:splashscreen/firebase_database/email_password_auth/home_page.dart';
import 'package:splashscreen/firebase_database/email_password_auth/registration_page.dart';
import 'package:splashscreen/firebase_database/email_password_auth/splash.dart';




class Login_page extends StatelessWidget {
  

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Login page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            MaterialButton(
              onPressed: () {
                String email=emailcontroller.text.trim();
                String password=passwordcontroller.text.trim();

                FireBaseFunction().loginuser(email:email,password:password).then((response){
                  if(response==null){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Fire_home()));
                  }else{
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(response)));
                  }

                });
              },
              shape: StadiumBorder(),
              child: Text('Login'),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Fire_Register()));
                },
                child: RichText(
                  text: TextSpan(text: 'Not a user?',style: TextStyle(color: Colors.black), children: [
                    TextSpan(
                        text: 'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                  ]),
                )),
          ],
        ),
      ),
    );
  }
}
