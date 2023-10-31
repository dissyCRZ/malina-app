import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderRatingContCubit extends Cubit<int> {
  MyOrderRatingContCubit() : super(5);
  change(int index) {
    emit(index);
  }
}
