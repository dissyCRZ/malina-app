// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:malina_mobile_app/features/address/data/models/address.dart';
import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import 'package:malina_mobile_app/features/my_orders/data/enums/order_status.dart';

abstract class AbstractOrderModel {
  final int id;
  final OrderStatusEnum status;
  final BusinessModel place;
  final DeliveryTypeEnum type;
  final AddressModel address;
  final DateTime date;
  abstract final products;
  AbstractOrderModel({
    required this.id,
    required this.status,
    required this.place,
    required this.type,
    required this.address,
    required this.date,
  });
}
