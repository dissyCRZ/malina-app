import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';

List<FoodModel> getFoodsByQuery(String query, List<FoodModel> allFoods) {
  List<FoodModel> foods = [];
  if (query == '') {
    return allFoods;
  }
  foods.addAll(
    allFoods.where(
      (element) => element.name.toLowerCase().contains(
            query.toLowerCase(),
          ),
    ),
  );
  foods.addAll(
    allFoods.where(
      (element) => element.shortDescription.toLowerCase().contains(
            query.toLowerCase(),
          ),
    ),
  );
  foods.addAll(
    allFoods.where(
      (element) => element.price.toString().toLowerCase().contains(
            query.toLowerCase(),
          ),
    ),
  );

  return foods;
}
