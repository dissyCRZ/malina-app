import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/features/cart_order_sheet/presentation/widgets/order_food_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

class OrderSheetContainer extends StatelessWidget {
  const OrderSheetContainer({
    super.key,
    required this.order,
  });

  final RestaurantOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return RoundedShadowContainer(
        margin: marginHV20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  order.restaurant.name,
                  style: it16,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.grey,
                  size: 15,
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: AppColor.grey,
            ),
            AnimatedSize(
              duration: const Duration(
                milliseconds: 300,
              ),
              child: CartOrderCheckoutList(order: order),
            ),
          ],
        ),
      );
    });
  }
}

class CartOrderCheckoutList extends StatefulWidget {
  const CartOrderCheckoutList({
    super.key,
    required this.order,
  });

  final RestaurantOrderModel order;

  @override
  State<CartOrderCheckoutList> createState() => _CartOrderCheckoutListState();
}

class _CartOrderCheckoutListState extends State<CartOrderCheckoutList> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    bool hasThree = widget.order.foods.length > 2;
    return Column(
      children: [
        ListView.builder(
          itemBuilder: (context, index) => OrderSheetFoodContainer(
            restaurant: widget.order,
            order: widget.order.foods[index],
          ),
          itemCount: isExpanded
              ? widget.order.foods.length
              : hasThree
                  ? 3
                  : widget.order.foods.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
        ),
        if (widget.order.foods.length > 3)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: AnimatedCrossFade(
                duration: const Duration(
                  milliseconds: 300,
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: Image.asset(
                  'assets/icons/double-up.png',
                  width: 15,
                  color: AppColor.grey,
                ),
                secondChild: Image.asset(
                  'assets/icons/double-down.png',
                  width: 15,
                  color: AppColor.grey,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
