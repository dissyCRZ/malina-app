import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantInfoActionCubit extends Cubit<int> {
  RestaurantInfoActionCubit()
      : super(
          0,
        );
  change(int action) {
    if(action>=0&&action<2) {
      emit(
      action,
    );
    }
  }
}
