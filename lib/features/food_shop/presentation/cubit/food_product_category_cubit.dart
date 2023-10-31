import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food_category.dart';
import 'package:malina_mobile_app/features/food_shop/data/repositories/food_repo.dart';

class FoodCategoryCubit extends Cubit<List<FoodCategoryModel>> {
  FoodCategoryCubit() : super([]);
  load() async {
    final categories = await FoodShopRepo().categoryList();
    emit(
      categories,
    );
  }
}
