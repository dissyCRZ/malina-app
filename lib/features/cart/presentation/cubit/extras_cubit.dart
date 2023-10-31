import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:malina_mobile_app/features/restaurant_foods/data/enums/food_extra.dart';

part 'extras_state.dart';

class OrderExtrasCubit extends Cubit<OrderExtrasState> {
  OrderExtrasCubit() : super(const OrderExtrasState([]));
  addExtra(FoodExtraEnum ingredient) {
    List<FoodExtraEnum> newIngredients = [...super.state.extras];
    newIngredients.add(ingredient);
    emit(
      OrderExtrasState(newIngredients),
    );
  }

  removeExtra(FoodExtraEnum extra) {
    List<FoodExtraEnum> newIngredients = [...super.state.extras];
    newIngredients.removeWhere(
      (element) => element == extra,
    );
    emit(
      OrderExtrasState(newIngredients),
    );
  }
}
