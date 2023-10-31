import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_code_state.dart';

class PhoneCodeCubit extends Cubit<PhoneCodeState> {
  PhoneCodeCubit() : super(PhoneCodeNotSend());
  getCode(String code) {
    emit(
      PhoneCodeSent(
        code: code,
      ),
    );
  }
}
