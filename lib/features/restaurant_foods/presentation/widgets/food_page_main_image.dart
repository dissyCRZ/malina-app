import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/models/product.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';

class ProductPageMainImage extends StatelessWidget {
  const ProductPageMainImage({
    super.key,
    required this.product,
  });

  final AbstractProduct product;

  @override
  Widget build(BuildContext context) {
    final isFood = product is FoodModel;
    return Stack(
      children: [
        SizedBox(
          width: 390.w,
          child: isFood
              ? CachedWithDefaultImage(
                  imageUrl: product.image,
                  defautImage: 'assets/debug/foods/1.png',
                )
              : CachedWithDefaultImage(
                  imageUrl: product.image,
                  defautImage: 'assets/debug/products/1.png',
                ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 390.w,
            padding: const EdgeInsets.all(
              15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                product.discount != null
                    ? Container(
                        height: 30.h,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.malina,
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                        child: Text(
                          '-${product.discount!.toStringAsFixed(0)}%',
                          style: h16white,
                        ),
                      )
                    : const SizedBox.shrink(),
                product.cookTime != null
                    ? Container(
                        height: 30.h,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.lightGrey,
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/time.png',
                              height: 13.h,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '~${product.cookTime!.toStringAsFixed(0)} мин',
                              style: it12,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
