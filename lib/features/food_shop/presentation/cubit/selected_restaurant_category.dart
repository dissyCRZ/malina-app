import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/barbershop_category.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';

class SelectedRestaurantCategory extends Cubit<BusinessCategoryModel> {
  SelectedRestaurantCategory(List<BusinessCategoryModel> tag)
      : super(
          tag.isNotEmpty
              ? tag.first
              : BusinessCategoryModel(
                  id: 0,
                  name: allOfThemString,
                ),
        );
  select(BusinessCategoryModel tag) {
    emit(tag);
  }
}
