import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';

class FoodContCubit extends Cubit<FoodModel> {
  FoodContCubit(FoodModel food) : super(food);
  change(FoodModel food) {
    emit(food);
  }
}
