import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/barbershop_category.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/repositories/beauty_repo.dart';

class BarbershopCategoryCubit extends Cubit<List<BusinessCategoryModel>> {
  BarbershopCategoryCubit() : super([]);
  load() async {
    final categories = await BeautyRepo().businessCategoryList();
    emit(
      categories,
    );
  }
}
