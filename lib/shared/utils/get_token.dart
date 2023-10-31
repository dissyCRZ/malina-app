import 'package:hive/hive.dart';

String? getToken() {
  final userBox = Hive.box('user');
  if (userBox.containsKey('token')) {
    // log(userBox.get('token'));
    return userBox.get('token');
  }
  return null;
}

String? getId() {
  final userBox = Hive.box('user');
  if (userBox.containsKey('id')) {
    return userBox.get('id');
  }
  return null;
}
