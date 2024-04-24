import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:splashscreen/firebase_database/phone_auth/verify_otp.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDzoXrzGuOtX9q4D5HaACgmPZQqd_qc98U",
          appId: "1:962969812983:android:6632537d72d18bb2eb38f2",
          messagingSenderId: "",
          projectId: "mygsignin-f7f9c"));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home_page(),
  ));
}

class Home_page extends StatelessWidget {
  final phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('phone auth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: phonecontroller,
                decoration: InputDecoration(
                  hintText: 'enter phone number',
                  border: OutlineInputBorder(),
                ),
              )),
          ElevatedButton(
              onPressed: () async {
                final FirebaseAuth auth = FirebaseAuth.instance;
                await auth.verifyPhoneNumber(
                    phoneNumber: phonecontroller.text.toString(),
                    timeout: Duration(seconds: 60),
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String validationid, int? resendtoken) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Verify_otp(verificationID: validationid)));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {});
              },
              child: Text('get otp')),
        ],
      ),
    );
  }
}
