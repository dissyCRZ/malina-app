import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedDateCubit extends Cubit<DateTime> {
  SelectedDateCubit()
      : super(
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            DateTime.now().hour,
          ),
        );
  changeDate(DateTime date) {
    emit(
      date,
    );
  }

  changeHour(int hour) {
    emit(
      DateTime(
        state.year,
        state.month,
        state.day,
        hour,
      ),
    );
  }
}
