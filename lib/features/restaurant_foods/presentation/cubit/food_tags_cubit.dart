import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food_category.dart';

class FoodTagsCubit extends Cubit<FoodCategoryModel> {
  FoodTagsCubit(List<FoodCategoryModel>? tag)
      : super(
          tag != null && tag.isNotEmpty
              ? tag.first
              : FoodCategoryModel(
                  id: 0,
                  name: 'Все',
                  supplier: 0,
                ),
        );
  change(FoodCategoryModel tag) {
    emit(
      tag,
    );
  }
}
