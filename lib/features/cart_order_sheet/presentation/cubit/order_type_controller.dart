import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';

class CartOrderTypeContCubit extends Cubit<DeliveryTypeEnum> {
  CartOrderTypeContCubit(DeliveryTypeEnum type) : super(type);
  change(DeliveryTypeEnum type) {
    emit(type);
  }
}
