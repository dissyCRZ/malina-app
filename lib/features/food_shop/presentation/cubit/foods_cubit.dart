import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import 'package:malina_mobile_app/features/food_shop/data/repositories/food_repo.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/foods_state.dart';

class FoodsCubit extends Cubit<FoodsState> {
  FoodsCubit() : super(const FoodsState([]));
  load() async {
    final foods = await FoodShopRepo().productList();
    emit(
      FoodsState(
        foods,
      ),
    );
  }

  FoodModel getFoodById(int id) {
    return state.foods.firstWhere(
      (element) => element.id == id,
    );
  }

  List<FoodModel> getFoodBySupplier(int id) {
    return state.foods
        .where(
          (element) => element.supplierId == id,
        )
        .toList();
  }
}
