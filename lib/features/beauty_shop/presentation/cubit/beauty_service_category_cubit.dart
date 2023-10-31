import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_category.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/repositories/beauty_repo.dart';

class BeautyServiceCategoryCubit extends Cubit<List<BeautyCategoryModel>> {
  BeautyServiceCategoryCubit() : super([]);
  load() async {
    final categories = await BeautyRepo().categoryList('beauty-service-category');
    emit(
      categories,
    );
  }
}
