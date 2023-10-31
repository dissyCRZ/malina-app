import 'package:flutter_bloc/flutter_bloc.dart';

class AddressPageContCubit extends Cubit<int> {
  AddressPageContCubit() : super(0);
  change(int page) {
    emit(page);
  }
}
