import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/beauty_cart_cubit.dart';
import 'package:malina_mobile_app/features/favourites/data/models/favourite_product.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';
import 'package:malina_mobile_app/shared/widgets/double_button.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

class FavouriteProductContainer extends StatelessWidget {
  final FavouriteProductModel product;
  const FavouriteProductContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      margin: marginHV5,
      shadow: smallShadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.barbershop.name,
            style: it16,
          ),
          const Divider(
            thickness: 1,
            color: AppColor.grey,
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: borderR10,
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: CachedWithDefaultImage(
                    imageUrl: product.product.image,
                    defautImage: 'assets/debug/products/1.png',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.product.name,
                          style: h16,
                        ),
                        Text(
                          '(${product.product.sizeOptions[0]} гр)',
                          style: it14,
                        ),
                      ],
                    ),
                    Text(
                      '${product.product.price}C',
                      style: st14,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          DoubleButtons(
            firstTitle: 'Удалить',
            secondTitle: 'В корзину',
            verticalMargin: 0,
            firstFunction: () {},
            secondFunction: () {
              context.read<BeautyCartCubit>().addOrder(product.product, 1);
            },
          ),
        ],
      ),
    );
  }
}
