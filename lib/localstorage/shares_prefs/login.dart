import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/localstorage/shares_prefs/home.dart';

class ShareLogin_page extends StatefulWidget {
  ShareLogin_page({super.key});

  @override
  State<ShareLogin_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<ShareLogin_page> {
  final username = TextEditingController();

  final password = TextEditingController();

  late SharedPreferences prefs;

  late bool isANewuser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'login_page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: username,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'username'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'password'),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      prefs = await SharedPreferences.getInstance();
                      String name = username.text;
                      String pass = password.text;

                      prefs.setBool('newuser', false);

                      String usename = prefs.getString('username')!;
                      String passw = prefs.getString('password')!;
                      if (name == usename && pass == passw) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Sharerhomepage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('invalid username or password')));
                      }
                    },
                    child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
