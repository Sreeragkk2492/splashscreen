
import 'package:hive/hive.dart';
part 'users.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;
  @HiveField(3)
  String?id;

  User({required this.username, required this.email, required this.password}){
  id=DateTime.now().microsecondsSinceEpoch.toString();
}
}
