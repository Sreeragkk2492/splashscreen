import 'package:hive_flutter/adapters.dart';
import 'package:splashscreen/localstorage/hiveadapter/model/users.dart';

class Hivedb{
  static Future<List<User>> getalluser() async{
    final db=await Hive.openBox<User>('userdata');
    return db.values.toList();
  }
static Future<void>adduser(User user)async{
  final db=await Hive.openBox<User>('userdata');
  db.put(user.id, user);
}
}