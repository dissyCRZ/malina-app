import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/cart/data/models/beauty_product_order.dart';
import 'package:malina_mobile_app/features/cart/presentation/widgets/beauty_amount_counter.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';

class BeautyOrderProductContainer extends StatelessWidget {
  final BeautyProductOrderModel productOrder;
  const BeautyOrderProductContainer({
    Key? key,
    required this.productOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: borderR10,
              child: Container(
                width: 110,
                height: 110,
                decoration: const BoxDecoration(
                  color: AppColor.softGrey,
                ),
                child: CachedWithDefaultImage(
                    imageUrl: productOrder.product.image,
                    defautImage: 'assets/debug/products/1.png',
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
                        productOrder.product.name,
                        style: h16,
                      ),
                      Text(
                        '${productOrder.product.price} C',
                        style: h16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${productOrder.product.shortDescription} (${productOrder.product.sizeOptions[0]} гр)',
                    style: it12,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BeautyAmountCounter(
                        amount: productOrder.amount,
                      ),
                      SizedBox(
                        width: 20,
                        child: Image.asset(
                          'assets/icons/trash-can.png',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
