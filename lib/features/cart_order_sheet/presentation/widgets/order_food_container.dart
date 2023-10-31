import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/cart/data/models/food_order.dart';
import 'package:malina_mobile_app/features/cart/data/models/restaurant_order.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';

class OrderSheetFoodContainer extends StatelessWidget {
  const OrderSheetFoodContainer({
    Key? key,
    required this.restaurant,
    required this.order,
  }) : super(key: key);
  final RestaurantOrderModel restaurant;
  final FoodOrderModel order;

  @override
  Widget build(BuildContext context) {
    final orderExtras = order.extras?.map((e) => '${e.name} ${e.price} C').join(
              ', ',
            ) ??
        '';
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                width: 40,
                height: 40,
                child: CachedWithDefaultImage(
                  imageUrl: order.product.image,
                  defautImage: 'assets/debug/foods/1.png',
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        order.product.name,
                        style: h16,
                      ),
                      Text(
                        '${order.product.price} C',
                        style: h16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${order.product.sizeOptions[0]} гр',
                    style: it12,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Количество: ${order.amount}',
                    style: it12,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 250.w),
                    child: Text(
                      'Добавки: $orderExtras',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: it12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          height: 20,
          thickness: 1,
          color: AppColor.grey,
        ),
      ],
    );
  }
}
