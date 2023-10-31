part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<RestaurantOrderModel> foodOrders;
  const CartState(
    this.foodOrders,
  );

  @override
  List<Object> get props => [foodOrders];
}
