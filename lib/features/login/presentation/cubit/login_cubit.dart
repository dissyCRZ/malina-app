import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:malina_mobile_app/features/login/data/models/user.dart';
import 'package:malina_mobile_app/features/login/data/repositories/login_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  static const tokenString = 'token';
  static const idString = 'id';
  LoginCubit() : super(Initial());
  init() async {
    final userBox = Hive.box('user');
    final isSigned = userBox.containsKey(
      tokenString,
    );
    if (isSigned) {
      late UserModel? user;
      UserModel? dummyUser = await LoginRepo().getMeRead();
      if (dummyUser != null) {
        user = dummyUser;
        dummyUser = await LoginRepo().userRead(dummyUser.id);
        if (dummyUser != null) {
          user = dummyUser;
        }
      }
      if (user != null) {
        emit(
          LoggedIn(
            user: user,
          ),
        );
      }
    }
  }

  String? getPhoneNumber() {
    final currentState = super.state;
    if (currentState is LoggedIn) {
      return currentState.user.phoneNumber;
    }
    return null;
  }

  String? getToken() {
    final currentState = super.state;
    if (currentState is LoggedIn) {
      return currentState.user.token;
    }
    return null;
  }

  String? getEmail() {
    final currentState = super.state;
    if (currentState is LoggedIn) {
      return currentState.user.email;
    }
    return null;
  }

  DateTime? getDatetime() {
    final currentState = super.state;
    if (currentState is LoggedIn) {
      return currentState.user.birthday;
    }
    return null;
  }

  Future<String?> sendCode(String phoneNumber) async {
    return await LoginRepo().sendCreate(
      phoneNumber,
    );
  }

  Future<String?> login(
    String phoneNumber,
    String code,
  ) async {
    emit(
      LoggingIn(),
    );
    final userBox = Hive.box('user');
    try {
      final responseToken = await LoginRepo().confirmCreate(
        phoneNumber,
        code,
      );
      if (responseToken != null) {
        userBox.put(
          tokenString,
          responseToken,
        );
        init();
      }
      return responseToken;
    } catch (e) {
      emit(
        LoginError(
          message: e.toString(),
        ),
      );
    }
    return null;
  }

  changePhone(String phone) {
    final currentState = super.state;
    LoginRepo().userUpdate(
      phone: phone,
    );
    if (currentState is LoggedIn) {
      emit(
        LoggedIn(
          user: UserModel(
            id: currentState.user.id,
            token: currentState.user.token,
            phoneNumber: phone,
            userName: currentState.user.userName,
            email: currentState.user.email,
            password: currentState.user.password,
            birthday: currentState.user.birthday,
          ),
        ),
      );
    }
  }

  changeUserName(String userName) {
    LoginRepo().userUpdate(
      name: userName,
    );
    final currentState = super.state;
    if (currentState is LoggedIn) {
      emit(
        LoggedIn(
          user: UserModel(
            id: currentState.user.id,
            token: currentState.user.token,
            userName: userName,
            phoneNumber: currentState.user.phoneNumber,
            email: currentState.user.email,
            password: currentState.user.password,
            birthday: currentState.user.birthday,
          ),
        ),
      );
    }
  }

  changeSurname(String surName) {
    LoginRepo().userUpdate(
      surname: surName,
    );
    final currentState = super.state;
    if (currentState is LoggedIn) {
      emit(
        LoggedIn(
          user: UserModel(
            id: currentState.user.id,
            token: currentState.user.token,
            userName: currentState.user.token,
            phoneNumber: currentState.user.phoneNumber,
            email: currentState.user.email,
            password: currentState.user.password,
            birthday: currentState.user.birthday,
          ),
        ),
      );
    }
  }

  changeBirtdate(DateTime date) {
    final currentState = super.state;
    LoginRepo().userUpdate(
      birtday: DateFormat('YYYY-MM-DD').format(date),
    );
    if (currentState is LoggedIn) {
      emit(
        LoggedIn(
          user: UserModel(
            id: currentState.user.id,
            token: currentState.user.token,
            userName: currentState.user.userName,
            phoneNumber: currentState.user.phoneNumber,
            email: currentState.user.email,
            password: currentState.user.password,
            birthday: date,
          ),
        ),
      );
    }
  }

  changeEmail(String email) {
    final currentState = super.state;
    LoginRepo().userUpdate(
      email: email,
    );
    if (currentState is LoggedIn) {
      emit(
        LoggedIn(
          user: UserModel(
            id: currentState.user.id,
            token: currentState.user.token,
            userName: currentState.user.userName,
            phoneNumber: currentState.user.phoneNumber,
            email: email,
            password: currentState.user.password,
            birthday: currentState.user.birthday,
          ),
        ),
      );
    }
  }

  changePassword(String password) {
    final currentState = super.state;
    LoginRepo().userUpdate(
      password: password,
    );
    if (currentState is LoggedIn) {
      emit(
        LoggedIn(
          user: UserModel(
            id: currentState.user.id,
            token: currentState.user.token,
            userName: currentState.user.userName,
            phoneNumber: currentState.user.phoneNumber,
            email: currentState.user.email,
            password: password,
            birthday: currentState.user.birthday,
          ),
        ),
      );
    }
  }

  logOut() {
    final userBox = Hive.box('user');
    userBox.clear();
    emit(
      LoggedOut(),
    );
  }
}
