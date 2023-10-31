import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/order.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/widgets/my_order_info_food_container.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class MyOrderInfoFoodList extends StatefulWidget {
  const MyOrderInfoFoodList({
    super.key,
    required this.order,
  });

  final MyOrderModel order;

  @override
  State<MyOrderInfoFoodList> createState() => _MyOrderInfoFoodListState();
}

class _MyOrderInfoFoodListState extends State<MyOrderInfoFoodList> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    bool hasThree = widget.order.products.length > 2;
    return Column(
      children: [
        ListView.builder(
          itemBuilder: (context, index) => MyOrderInfoFoodContainer(
            order: widget.order.products[index],
          ),
          itemCount: isExpanded
              ? widget.order.products.length
              : hasThree
                  ? 3
                  : widget.order.products.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
        ),
        if (widget.order.products.length > 3)
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
