import 'package:malina_mobile_app/shared/utils/get_token.dart';

class UserModel {
  final int id;
  final String? userName;
  final String? email;
  final DateTime? birthday;
  final String? password;
  final String phoneNumber;
  final String token;
  UserModel({
    required this.id,
    this.userName,
    this.email,
    this.birthday,
    this.password,
    required this.phoneNumber,
    required this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      userName: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      birthday: map['birthday'] != null
          ? DateTime.parse(
              map['birthday'],
            )
          : null,
      password: map['password'] != null ? map['password'] as String : null,
      phoneNumber: map['login'] as String,
      token: getToken() ?? '',
    );
  }
}
