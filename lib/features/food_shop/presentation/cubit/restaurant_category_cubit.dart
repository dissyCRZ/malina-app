import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/barbershop_category.dart';
import 'package:malina_mobile_app/features/food_shop/data/repositories/food_repo.dart';

class RestaurantCategoryCubit extends Cubit<List<BusinessCategoryModel>> {
  RestaurantCategoryCubit() : super([]);
  load() async {
    final categories = await FoodShopRepo().businessCategoryList();
    emit(
      categories,
    );
  }
}
