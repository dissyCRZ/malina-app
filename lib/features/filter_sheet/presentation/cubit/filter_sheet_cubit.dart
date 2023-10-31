import 'package:flutter_bloc/flutter_bloc.dart';

class FilterSheetCubit extends Cubit<int> {
  FilterSheetCubit() : super(0);
  select(int index) {
    if (super.state == index + 1) {
      emit(0);
    } else {
      emit(index + 1);
    }
  }
}
