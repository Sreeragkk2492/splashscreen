import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splashscreen/localstorage/sqflite/todo_withsqflite/dbfunction.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Mytodo(),
  ));
}

class Mytodo extends StatefulWidget {
  const Mytodo({super.key});

  @override
  State<Mytodo> createState() => _MytodoState();
}

class _MytodoState extends State<Mytodo> {
  final titlecontroller = TextEditingController();
  final contentcontroller = TextEditingController();
  var tasks = [];
  bool isLoading = true;
  @override
  void initState() {
    loadtask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: isLoading
          ? Center(
              child: Lottie.asset('assets/images/anim.gif'),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'My task',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
                Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.red, 
                            child: Column(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  tasks[index]['title'],
                                  style: TextStyle(fontSize: 22),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(tasks[index]['content'],style: TextStyle(fontSize: 21),),
                                Wrap(
                                  children: [
                                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                                  ],
                                )
                              ],
                            ),
                          );
                        }))
              ],
            ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showsheet(null);
          }),
    );
  }

  void showsheet(int? id) async {
    if (id!=null) {
      final existingdata=tasks.firstWhere((element) => element==id);
      titlecontroller.text=existingdata['title'];
      contentcontroller.text=existingdata['content'];
      
    }
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
              padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 120),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titlecontroller,
                    decoration: InputDecoration(
                        hintText: 'title',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: contentcontroller,
                    decoration: InputDecoration(
                        hintText: 'content',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (id == null) {
                          createtask();
                          titlecontroller.text='';
                          contentcontroller.text='';
                        } else {
                          if(id!=null){
                        updatetask(id,titlecontroller.text,contentcontroller.text);
                          }
                        }
                        Navigator.of(context).pop();
                      },
                      child: Text(id == null ? 'create task' : 'update task')),
                ],
              ),
            ));
  }

  Future<void> createtask() async {
    var id =
        await SQLHelper.create(titlecontroller.text, contentcontroller.text);
    print(id);
    loadtask();
  }

  Future<void> loadtask() async {
    final tsk = await SQLHelper.readtask();
    setState(() {
      tasks = tsk;
      isLoading = false;
    });
  }
  
 Future <void> updatetask(int id, String utitle, String ucontent) async{
  await SQLHelper.update(id, utitle, ucontent);
  loadtask();
  }
}
