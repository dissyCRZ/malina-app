import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'restaurant_info_state.dart';

class RestaurantInfoCubit extends Cubit<RestaurantInfoState> {
  RestaurantInfoCubit() : super(RestaurantInfoInitial());
}
