import 'package:flutter/material.dart';
import 'package:splashscreen/home.dart';
import 'package:splashscreen/listview/listview.dart';
import 'package:splashscreen/signup.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernamecontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  String username = 'sreerag';

  String password = '1234567';

  bool showpassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/image2.png',
            width: 100,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: usernamecontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "username",
                // hintText: "username",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              
              obscureText: showpassword,
              obscuringCharacter: '*',
              controller: passwordcontroller,
              
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.privacy_tip),
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    if(showpassword){
                      showpassword=false;
                    }else{
                      showpassword=true;
                    }
                  });
                }, icon: Icon(showpassword?Icons.visibility_off:Icons.visibility)),
                labelText: "password",

                /// hintText: "password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          ElevatedButton(
            onPressed: () {
              if (usernamecontroller.text != " " &&
                  passwordcontroller.text != " ") {
                if (usernamecontroller.text == username &&
                    passwordcontroller.text == password) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (builder) => Listview1()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: Text("username & password is incorrect"),
                  ));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("username & password is required"),
                ));
              }
            },
            child: Text('login'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('not a user!'),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Signup()));
                  },
                  child: Text(
                    "register",
                    style: TextStyle(fontSize: 17),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
