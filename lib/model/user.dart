import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String login;

  @HiveField(1)
  final String password;

  @HiveField(2)
  final String email;

  @HiveField(3)
  bool isAuthenticated;

  User({required this.login, required this.password, required this.email, required this.isAuthenticated});
}
