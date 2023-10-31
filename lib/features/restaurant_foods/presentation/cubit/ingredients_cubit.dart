import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:malina_mobile_app/features/restaurant_foods/data/enums/food_extra.dart';

part 'ingredients_state.dart';

class IngredientsCubit extends Cubit<IngredientsState> {
  IngredientsCubit() : super(const IngredientsState([]));
  addExtra(FoodExtraEnum ingredient) {
    List<FoodExtraEnum> newIngredients = [...super.state.extras];
    newIngredients.add(ingredient);
    emit(
      IngredientsState(newIngredients),
    );
  }

  removeExtra(FoodExtraEnum extra) {
    List<FoodExtraEnum> newIngredients = [...super.state.extras];
    newIngredients.removeWhere(
      (element) => element == extra,
    );
    emit(
      IngredientsState(newIngredients),
    );
  }
}
