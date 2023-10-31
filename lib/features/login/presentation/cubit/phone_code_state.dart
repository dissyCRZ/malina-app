part of 'phone_code_cubit.dart';

abstract class PhoneCodeState extends Equatable {
  const PhoneCodeState();

  @override
  List<Object> get props => [];
}

class PhoneCodeNotSend extends PhoneCodeState {}

class PhoneCodeSent extends PhoneCodeState {
  final String code;
  const PhoneCodeSent({
    required this.code,
  });

  @override
  List<Object> get props => [code];
}
