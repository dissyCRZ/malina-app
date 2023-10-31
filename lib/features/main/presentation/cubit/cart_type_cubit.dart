import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/main/data/enums/cart_type.dart';

class CartTypeCubit extends Cubit<CartTypeEnum> {
  CartTypeCubit()
      : super(
          CartTypeEnum.food,
        );
  change(CartTypeEnum type) {
    emit(type);
  }
}
