import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import 'package:equatable/equatable.dart';

class FoodsState extends Equatable {
  final List<FoodModel> foods;
  const FoodsState(
    this.foods,
  );

  @override
  List<Object> get props => [foods];
}
