import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDzoXrzGuOtX9q4D5HaACgmPZQqd_qc98U",
          appId: "1:962969812983:android:6632537d72d18bb2eb38f2",
          messagingSenderId: "",
          storageBucket: "mygsignin-f7f9c.appspot.com",
          projectId: "mygsignin-f7f9c"));
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Firestorage(),
  ));
}

class Firestorage extends StatefulWidget {
  const Firestorage({super.key});

  @override
  State<Firestorage> createState() => _FirestorageState();
}

class _FirestorageState extends State<Firestorage> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Fire storage'),
        actions: [
          IconButton(
              onPressed: () {
                upload('camera');
              },
              icon: const Icon(Icons.camera)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      upload('camera');
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text('camera')),
                ElevatedButton.icon(
                    onPressed: () {
                      upload('gallery');
                    },
                    icon: const Icon(Icons.photo),
                    label: const Text('gallery'))
              ],
            ),
            Expanded(
                child: FutureBuilder(
                    future: loadmedia(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<Map<String, dynamic>> urls = snapshot.data ?? [];
                        return ListView.builder(
                            itemCount: urls.length,
                            itemBuilder: (context, index) {
                              final image = urls[index];
                              final credit = urls[index];
                              final dates = urls[index];
                              final pathes = urls[index];
                              return Card(
                                child: ListTile(
                                  leading: Image.network(image['imageurl']),
                                  title: Text(credit['credit']),
                                  subtitle: Text(dates['date']),
                                  trailing: ElevatedButton.icon(
                                      onPressed: () {
                                        deleteitem(pathes['path']);
                                      },
                                      icon: const Icon(Icons.delete),
                                      label: const Text('Delete')),
                                ),
                              );
                            });
                      }
                    }))
          ],
        ),
      ),
    );
  }

  Future<void> upload(String imgsourse) async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedimage;
    try {
      pickedimage = await picker.pickImage(
          source:
              imgsourse == 'camera' ? ImageSource.camera : ImageSource.gallery);
      final String filename = path.basename(pickedimage!.path);
      File imagefile = File(pickedimage.path);
      try {
        await storage.ref(filename).putFile(
            imagefile,
            SettableMetadata(customMetadata: {
              'pic_credits': 'someone',
              'date': '05/2/2024'
            }));
        setState(() {});
      } catch (error) {
        print(error);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> loadmedia() async {
    List<Map<String, dynamic>> images = [];
    final ListResult result = await storage.ref().list();
    final List<Reference> allfiles = result.items;
    await Future.forEach(allfiles, (singlefile) async {
      final imageurl = await singlefile.getDownloadURL();
      final FullMetadata metadata = await singlefile.getMetadata();

      images.add({
        'imageurl': imageurl,
        'path': singlefile.fullPath,
        'credit': metadata.customMetadata?['pic_credits'] ?? 'no data',
        'date': metadata.customMetadata?['date'] ?? 'no date'
      });
    });
    return images;
  }

  Future<void> deleteitem(String filepath) async {
    try {
      final Reference files = storage.ref(filepath);
      await files.delete();
      setState(() {});
    } catch (exception) {
      print(exception);
    }
  }
}
