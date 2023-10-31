import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneNumberCubit extends Cubit<String> {
  PhoneNumberCubit() : super('+996700123456');
  change(String number) {
    emit(number);
  }
}
