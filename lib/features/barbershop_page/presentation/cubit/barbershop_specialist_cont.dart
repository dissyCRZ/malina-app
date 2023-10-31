import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_abstract_cont.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_specialty.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';

class SelectedBeautySpecialistCategory extends BarbershopAbstractCubit {
  SelectedBeautySpecialistCategory(List<BeautySpecialtyModel> tag)
      : super(
          tag.isNotEmpty
              ? tag.first
              : BeautySpecialtyModel(
                  id: 0,
                  name: allOfThemString,
                ),
        );
}
