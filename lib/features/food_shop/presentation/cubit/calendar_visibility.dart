import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarVisibilityCubit extends Cubit<bool> {
  CalendarVisibilityCubit() : super(false);
  change() {
    emit(!super.state);
  }
}
