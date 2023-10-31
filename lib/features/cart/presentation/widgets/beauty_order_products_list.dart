import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/cart/data/models/beauty_order.dart';
import 'package:malina_mobile_app/features/cart/presentation/widgets/beauty_order_product_container.dart';
import '../../../../shared/constants/colors.dart';

class BeautyOrderProductsList extends StatefulWidget {
  const BeautyOrderProductsList({
    super.key,
    required this.order,
  });

  final BeautyOrderModel order;

  @override
  State<BeautyOrderProductsList> createState() =>
      _BeautyOrderProductsListState();
}

class _BeautyOrderProductsListState extends State<BeautyOrderProductsList> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    bool hasThree = widget.order.products.length >= 2;
    return AnimatedSize(
      duration: const Duration(
        milliseconds: 300,
      ),
      child: Column(
        children: [
          ListView.separated(
            itemBuilder: (context, index) => BeautyOrderProductContainer(
              productOrder: widget.order.products[index],
            ),
            itemCount: isExpanded
                ? widget.order.products.length
                : hasThree
                    ? 2
                    : widget.order.products.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          ),
          if (widget.order.products.length > 2)
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
      ),
    );
  }
}
