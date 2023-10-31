import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'order_container.dart';

class FoodCartListContainer extends StatelessWidget {
  final List<RestaurantOrderModel> orders;
  const FoodCartListContainer({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => OutsideOrderContainer(
        order: orders[index],
      ),
      itemCount: orders.length,
    );
  }
}
