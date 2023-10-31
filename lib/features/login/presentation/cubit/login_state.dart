part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class Initial extends LoginState {}
class LoggedOut extends LoginState {}

class LoggedIn extends LoginState {
  final UserModel user;
  const LoggedIn({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class LoggingIn extends LoginState {}

class LoginError extends LoginState {
  final String message;
  const LoginError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
