import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/repositories/beauty_repo.dart';
import '../../data/models/beauty_product.dart';

class BeautyProductsCubit extends Cubit<List<BeautyProductModel>> {
  BeautyProductsCubit()
      : super(
          [],
        );
  load() async {
    final beautyProducts = await BeautyRepo().productList();
    emit(
      beautyProducts,
    );
  }

  BeautyProductModel getById(int id) {
    return state.firstWhere(
      (element) => element.id == id,
    );
  }

  List<BeautyProductModel> getFoodBySupplier(int id) {
    return state
        .where(
          (element) => element.supplierId == id,
        )
        .toList();
  }
}
