import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/localstorage/shares_prefs/login.dart';

class Sharerhomepage extends StatefulWidget {
 

  @override
  State<Sharerhomepage> createState() => _SharerhomepageState();
}

class _SharerhomepageState extends State<Sharerhomepage> {
  late SharedPreferences prefs;
  late String username;

  @override
  void initState() {
   fetchdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('welcome $username',style: TextStyle(color: Colors.white,fontSize: 30),),
            SizedBox(
              height: 20,
            ),
            IconButton(onPressed: ()async{
              prefs=await SharedPreferences.getInstance();
              prefs.setBool('newuser', true);
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShareLogin_page()));
            }, icon: Icon(Icons.logout,color: Colors.white,)),
          ],
        ),
      ),
    );
  }
  
 Future <void> fetchdata() async{
  prefs=await SharedPreferences.getInstance();
setState(() {
 username =prefs.getString('username')!;
});
 }
}