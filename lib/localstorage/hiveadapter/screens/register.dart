import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:splashscreen/localstorage/hiveadapter/model/users.dart';
import 'package:splashscreen/localstorage/hiveadapter/screens/login.dart';
import 'package:splashscreen/localstorage/hiveadapter/services/hivedb.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
 Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('userdata');
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Registerationpage(),
  ));
}

class Registerationpage extends StatelessWidget {
  final usernam = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user register'),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernam,
                decoration: InputDecoration(
                    hintText: 'username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: 'email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: pass,
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
                    final reguser = await Hivedb.getalluser();
                    validatesignup(context, reguser);
                    
                  },
                  child: Text('Register ')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('already register'),
                  TextButton(
                      onPressed: () {
                        Get.to(Loginuserpage());
                      },
                      child: Text('login'))
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  void validatesignup(BuildContext context, List<User> reguser) async {
    final emails = email.text;
    final password = pass.text;
    final name = usernam.text;
    bool userExist = false;
    final validateemail = EmailValidator.validate(emails);
    if (emails != '' && password != '' && name != '') {
      if (validateemail == true) {
        await Future.forEach(reguser, (singlleuser) {
          if (singlleuser.email == emails) {
            userExist = true;
          } else {
            userExist = false;
          }
        });
        if (userExist == true) {
          Get.snackbar('failed', 'user already exist',
              colorText: Colors.red, backgroundColor: Colors.red[100]);
        } else {
          if (password.length < 6) {
            Get.snackbar('error', 'password should be >=6');
          } else {
            final user =
                User(username: name, email: emails, password: password);
            await Hivedb.adduser(user);
            Get.snackbar('success', 'user ragistration suuccess');
          }
        }
      }else{
         Get.snackbar('invalid data', 'invalid email address');
      }
    }else{
      Get.snackbar('empty fields', 'field must not be empty');
    }
  }
}
