import 'dart:convert';
import 'dart:developer';
import 'package:malina_mobile_app/features/login/data/models/user.dart';
import 'package:malina_mobile_app/shared/classes/base_http_client.dart';
import 'package:malina_mobile_app/shared/utils/get_device_id.dart';
import 'package:malina_mobile_app/shared/utils/get_token.dart';

class LoginRepo {
  Future<UserModel?> getMeRead() async {
    final response = await BaseHttpClient().get(
      'users/get-me/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response);
        return UserModel.fromMap(
          body,
        );
      } catch (e) {
        log('Someting wrong: $e');
        return null;
      }
    } else {
      return null;
    }
  }

  Future<UserModel?> userRead(int id) async {
    final response = await BaseHttpClient().get(
      'users/user/$id/',
    );
    if (response != null) {
      try {
        final body = jsonDecode(response);
        return UserModel.fromMap(
          body,
        );
      } catch (e) {
        log('Someting wrong: $e');
        return null;
      }
    } else {
      return null;
    }
  }

  Future<String?> sendCreate(String phoneNumber) async {
    final response = await BaseHttpClient().post(
      'users/send/',
      {
        "phone": phoneNumber,
      },
    );
    if (response != null) {
      try {
        final message = jsonDecode(response)['message'];
        log(message.toString());
        return message;
      } catch (e) {
        log('Someting wrong: $e');
        return null;
      }
    } else {
      return null;
    }
  }

  Future<String?> confirmCreate(String phoneNumber, String code) async {
    final deviceId = await getDeviceId();
    final response = await BaseHttpClient().post('users/confirm/', {
      'phone': phoneNumber,
      "confirmation_code": code,
      "device_id": deviceId,
    });
    if (response != null) {
      try {
        final token = jsonDecode(response)['token'];
        return token;
      } catch (e) {
        log('Someting wrong: $e');
        return null;
      }
    } else {
      return null;
    }
  }

  Future<String?> userUpdate({
    String? email,
    String? phone,
    String? name,
    String? surname,
    String? birtday,
    String? password,
  }) async {
    Map<String, String> body = {};
    if (email != null) body['email'] = email;
    if (phone != null) body['phone'] = phone;
    if (name != null) body['name'] = name;
    if (surname != null) body['surname'] = surname;
    if (birtday != null) body['birtday'] = birtday;
    if (password != null) body['password'] = password;
    final id = getId();
    if (id == null) return null;
    final response = await BaseHttpClient().patch(
      'users/user/$id',
      body,
    );
    if (response != null) {
      try {
        final token = jsonDecode(response)['token'];
        return token;
      } catch (e) {
        log('Someting wrong: $e');
        return null;
      }
    } else {
      return null;
    }
  }
}
