import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../food_shop/data/models/place.dart';

class RestaurantContCubit extends Cubit<BusinessModel> {
  RestaurantContCubit(BusinessModel restaurant) : super(restaurant);
  change(BusinessModel restaurant) {
    emit(restaurant);
  }
}
