
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<sql.Database> createDB() async {
  return  await sql.openDatabase('todo', version: 1,
        onCreate: (database, version) async {
      await createtable(database);
    });
  }

  static Future<int> create(String title, String content)async {
    final db=await SQLHelper.createDB();
    var data={'title':title,'content':content};
    final id=db.insert('task', data);
    return id;
  }

  static Future<void> createtable(sql.Database database) async {
    await database.execute(
        'CREATE TABLE task (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, content TEXT)');
  }

static Future<List<Map<String,dynamic>>> readtask()async{
  final db=await SQLHelper.createDB();
  return db.query('task',orderBy: 'id');
}

static Future <int> update(int id,String utitle,String ucontent)async{
   final db=await SQLHelper.createDB();
   var udata={'title':utitle,'content':ucontent};
   final uid=db.update('task', udata,where: 'id=?',  whereArgs: [id]);
   return uid;
}
static Future<void> deletetask(int id)async{
    final db=await SQLHelper.createDB();
    try{
     await db.delete('task',where: 'id=?',whereArgs: [id]);
    }catch(e){
      print(e);
    }
}

}
