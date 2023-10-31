part of 'my_orders_cubit.dart';

class MyOrdersState extends Equatable {
  final List<MyOrderModel> orders;
  final List<MyBeautyOrderModel> beautyOrders;
  const MyOrdersState(
    this.orders,
    this.beautyOrders,
  );

  @override
  List<Object> get props => [
        orders,
        beautyOrders,
      ];
}
