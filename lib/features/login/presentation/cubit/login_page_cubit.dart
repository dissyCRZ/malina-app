import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageCubit extends Cubit<int> {
  LoginPageCubit() : super(0);
  change(int index) {
    emit(index);
  }
}
