import 'package:flutter_bloc/flutter_bloc.dart';

class BookingSheetContCubit extends Cubit<bool> {
  BookingSheetContCubit() : super(false);
  change() {
    emit(true);
  }
}
