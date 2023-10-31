part of 'beauty_cart_cubit.dart';

class BeautyCartState extends Equatable {
  final List<BeautyOrderModel> beautyOrders;
  const BeautyCartState(
    this.beautyOrders,
  );

  @override
  List<Object> get props => [
        beautyOrders,
      ];
}
