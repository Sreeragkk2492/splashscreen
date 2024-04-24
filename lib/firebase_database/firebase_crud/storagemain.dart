import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDzoXrzGuOtX9q4D5HaACgmPZQqd_qc98U",
          appId: "1:962969812983:android:6632537d72d18bb2eb38f2",
          messagingSenderId: "",
          projectId: "mygsignin-f7f9c",
          storageBucket: "mygsignin-f7f9c.appspot.com"));
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirebaseCRUD(),
  ));
}

class FirebaseCRUD extends StatefulWidget {
  const FirebaseCRUD({super.key});

  @override
  State<FirebaseCRUD> createState() => _FirebaseCRUDState();
}

class _FirebaseCRUDState extends State<FirebaseCRUD> {
  final cnamecontroller = TextEditingController();
  final cemail = TextEditingController();
  late CollectionReference _usercollection;

  @override
  void initState() {
    _usercollection = FirebaseFirestore.instance.collection('userData');
    super.initState();
  } //object of collection in db

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user data'),
        backgroundColor: Colors.blueGrey,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: readuser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final users = snapshot.data!.docs;
            return Container(
              child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    final userId = user.id;
                    final username = user['name'];
                    final email = user['email'];
              
                    return ListTile(
                      title: Text(
                        username,
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        email,
                        style: TextStyle(fontSize: 22),
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () {
                                edituser(userId);
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                deleteuser(userId);
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                    );
                  }),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          adduser();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void adduser() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('add user'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: cnamecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'enter your name'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: cemail,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'enter your email'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      addusertodb(cnamecontroller.text, cemail.text);
                    },
                    child: Text('create user')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('cancel'))
              ],
            ));
  }

  Future<void> addusertodb(String name, String email) async {
    return _usercollection.add({
      'name': name,
      'email': email,
    }).then((value) {
      print('user added succesfully');
      cnamecontroller.clear();
      cemail.clear();
      Navigator.of(context).pop();
    }).catchError((e) {
      print('failed to add data $e');
    });
  }

  Stream<QuerySnapshot> readuser() {
    return _usercollection.snapshots();
  }

  Future<void> edituser(String userId) {
    final username = TextEditingController();
    final useremail = TextEditingController();
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'enter your name'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: useremail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'enter your email'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      updateuser(userId, username.text, useremail.text);
                      username.clear();
                      useremail.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text('updateuser')),
              ],
            ),
          );
        });
  }

  Future<void> updateuser(String userId, String uname, String uemail) async {
    var updatedvalues = {'name': uname, 'email': uemail};
    return _usercollection.doc(userId).update(updatedvalues).then((response) {
      print('updated successfully');
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e)));
    });
  }

  Future<void> deleteuser(String userId) async {
    return _usercollection.doc(userId).delete().then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('user deleted')));
    });
  }
}
