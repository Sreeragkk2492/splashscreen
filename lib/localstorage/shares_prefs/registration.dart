import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/localstorage/shares_prefs/login.dart';

class Share_register extends StatelessWidget {
   Share_register({super.key});

   final usercontroller=TextEditingController();
   final passcontroller=TextEditingController();

   late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue, 
      appBar: AppBar(
        backgroundColor: Colors.blue,  
      ),
      body:  Center(
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
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: usercontroller,
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
                    controller: passcontroller,
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
                      String username=usercontroller.text;
                      String password=passcontroller.text;
                      prefs=await SharedPreferences.getInstance();

                      prefs.setString('username', username);
                      prefs.setString('password', password);

                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShareLogin_page()));
                  
                    },
                    child: Text('Register'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}