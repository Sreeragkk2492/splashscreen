import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('todo');
  runApp(MaterialApp(
    home: Hivecrud(),
  ));
}

class Hivecrud extends StatefulWidget {
  const Hivecrud({super.key});

  @override
  State<Hivecrud> createState() => _HivecrudState();
}

class _HivecrudState extends State<Hivecrud> {
  final ctitle = TextEditingController();
  final ccontent = TextEditingController();
  final box = Hive.box('todo');
  var mytasks = [];
  @override
  void initState() {
    loadorreadtask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hive_crud'),
          actions: [
            IconButton(
                onPressed: () {
                  createdialog(null);
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: mytasks.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: mytasks.length,
                itemBuilder: (context, index) => Card(
                      child: ListTile(
                        leading: Text("${mytasks[index]['id']}"),
                        title: Text(mytasks[index]['title']),
                        subtitle: Text(mytasks[index]['content']),
                        trailing: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {
                                  createdialog(mytasks[index]['id']);
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () async {
                                  await box.delete(mytasks[index]['id']);
                                  loadorreadtask();
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    )));
  }

  void createdialog(int? key) {
    if (key != null) {
      final existingdata =
          mytasks.firstWhere((element) => element['id'] == key);
      ctitle.text = existingdata['title'];
      ccontent.text = existingdata['content'];
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(key == null ? 'create' : 'update'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: ctitle,
                    decoration: InputDecoration(
                        hintText: 'title', border: OutlineInputBorder()),
                  ),
                  TextField(
                    controller: ccontent,
                    decoration: InputDecoration(
                        hintText: 'content', border: OutlineInputBorder()),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (key == null) {
                        createtask(
                            {'title': ctitle.text, 'content': ccontent.text});
                        ctitle.clear();
                        ccontent.clear();
                      }
                      if (key != null) {
                        updatetask(key,
                            {'title': ctitle.text, 'content': ccontent.text});
                        ctitle.clear();
                        ccontent.clear();
                      }
                    },
                    child: Text(key == null ? "create" : "update")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('cancel'))
              ],
            ));
  }

  Future<void> createtask(Map<String, dynamic> task) async {
    await box.add(task);
    loadorreadtask();
    Navigator.of(context).pop();
  }

  Future<void> loadorreadtask() async {
    final taskfromhive = box.keys.map((e) {
      final value = box.get(e);
      return {'id': e, 'title': value['title'], 'content': value['content']};
    }).toList();
    setState(() {
      mytasks = taskfromhive.toList();
    });
  }

  Future<void> updatetask(int key, Map<String, String> uptask) async {
    await box.put(key, uptask);
    loadorreadtask();
    Navigator.of(context).pop();
  }
}
