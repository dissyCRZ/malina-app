import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/beauty_order.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'order_image.dart';

class MyBeautyOrderImagesList extends StatelessWidget {
  const MyBeautyOrderImagesList({
    Key? key,
    required this.order,
  }) : super(key: key);

  final MyBeautyOrderModel order;

  @override
  Widget build(BuildContext context) {
    final images = order.products
        .map(
          (e) => 'products/${e.product.image}',
        )
        .toList();
    final bool hasMore = images.length > 6;
    final int howMany = images.length - 6;
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => MyOrderImage(
                image: images[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: hasMore ? 6 : images.length,
            ),
          ),
          hasMore
              ? Text(
                  '+ $howMany',
                  style: st14,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
