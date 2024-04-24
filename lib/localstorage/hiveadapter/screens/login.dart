import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/localstorage/hiveadapter/model/users.dart';
import 'package:splashscreen/localstorage/hiveadapter/screens/homepage.dart';
import 'package:splashscreen/localstorage/hiveadapter/screens/register.dart';
import 'package:splashscreen/localstorage/hiveadapter/services/hivedb.dart';

class Loginuserpage extends StatelessWidget {
  Loginuserpage({super.key});
  final ecotroller = TextEditingController();
  final pcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user login'),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: ecotroller,
                decoration: InputDecoration(
                    hintText: 'email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: pcontroller,
                decoration: InputDecoration(
                    hintText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final getalluser = await Hivedb.getalluser();
                    validatelogin(getalluser);
                  },
                  child: Text('Login ')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('dont have account'),
                  TextButton(
                      onPressed: () {
                        Get.to(Registerationpage());
                      },
                      child: Text('register'))
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  void validatelogin(List<User> getalluser) async {
    final lemail = ecotroller.text;
    final lpass = pcontroller.text;
    //  bool userExist=false;

    if (lemail != '' && lpass != '') {
      await Future.forEach(getalluser, (singleuser) {
        if (lemail == singleuser.email && lpass == singleuser.password) {
          final uname=singleuser.username;
          Get.offAll(Homehivepage(uname: uname,));
          Get.snackbar('success', 'login successful');
        } else {
          Get.snackbar('error', 'invalid credentials');
        }
      });
    } else {
      Get.snackbar('error', 'fields must not be empty');
    }
  }
}
