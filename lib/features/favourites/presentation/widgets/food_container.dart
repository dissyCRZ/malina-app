import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';
import 'package:malina_mobile_app/shared/widgets/double_button.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

class FavouriteFoodContainer extends StatelessWidget {
  final FoodModel food;
  const FavouriteFoodContainer({
    Key? key,
    required this.food,
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
            food.name,
            style: it16,
          ),
          const Divider(
            thickness: 1,
            color: AppColor.grey,
            height: 20,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: borderR10,
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: CachedWithDefaultImage(
                    imageUrl: food.image,
                    defautImage: 'assets/debug/foods/1.png',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.name,
                          style: h16,
                        ),
                        Text(
                          '${food.sizeOptions[0]} гр',
                          style: it14,
                        ),
                      ],
                    ),
                    Text(
                      '${food.price}C',
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
            firstFunction: () {
              context.read<FavouritesCubit>().favouriteAction(food);
            },
          ),
        ],
      ),
    );
  }
}
