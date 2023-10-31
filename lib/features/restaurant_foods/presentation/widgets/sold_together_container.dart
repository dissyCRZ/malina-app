import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'package:malina_mobile_app/shared/models/together_product.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';
import 'package:malina_mobile_app/shared/widgets/favourite_button.dart';

class SoldTogetherContainer extends StatelessWidget {
  final RelatedProduct product;
  const SoldTogetherContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFood = product is FoodModel;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: borderR20,
        boxShadow: [
          smallShadow,
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: isFood
                      ? CachedWithDefaultImage(
                          imageUrl: product.image,
                          defautImage: 'assets/debug/foods/1.png',
                          defaultCover: BoxFit.cover,
                        )
                      : CachedWithDefaultImage(
                          imageUrl: product.image,
                          defautImage: 'assets/debug/products/1.png',
                          defaultCover: BoxFit.contain,
                        ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  width: 150.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: h16,
                      ),
                      Text(
                        product.supplier.toString(),
                        maxLines: 1,
                        style: st12,
                      ),
                      Container(
                        width: 120.w,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor.lightGrey,
                          borderRadius: borderR12,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${product.price} C',
                          style: st16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: FavouriteButton(
              isFavourite: false,
              hasShadow: true,
              function: () {},
            ),
          ),
        ],
      ),
    );
  }
}
