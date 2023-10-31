import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_product.dart';

class ProductContCubit extends Cubit<BeautyProductModel> {
  ProductContCubit(BeautyProductModel product) : super(product);
  change(BeautyProductModel product) {
    emit(product);
  }
}
