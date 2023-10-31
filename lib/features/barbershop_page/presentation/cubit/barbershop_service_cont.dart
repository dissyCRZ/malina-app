import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_abstract_cont.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_category.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';

class SelectedBeautyServiceCategory extends BarbershopAbstractCubit {
  SelectedBeautyServiceCategory(List<BeautyCategoryModel> tag)
      : super(
          tag.isNotEmpty
              ? tag.first
              : BeautyCategoryModel(
                  id: 0,
                  name: allOfThemString,
                  description: allOfThemString,
                ),
        );
}
