import 'package:flutter_bloc/flutter_bloc.dart';

class MyInfoSheetContCubit extends Cubit<int> {
  MyInfoSheetContCubit() : super(0);
  change(int index) {
    emit(index);
  }
}
