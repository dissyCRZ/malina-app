import 'package:flutter_bloc/flutter_bloc.dart';

class GuestCountCubit extends Cubit<int> {
  GuestCountCubit()
      : super(
          1,
        );

  change(int count) {
    if (count > 0) {
      emit(count);
    }
  }
}
