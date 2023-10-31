import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/data/repositories/food_repo.dart';
import '../../data/models/place.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(const RestaurantState([]));
  load() async {
    final restaurants = await FoodShopRepo().businessList();
    emit(
      RestaurantState(
        restaurants,
      ),
    );
  }
}
