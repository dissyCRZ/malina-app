import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/food.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/foods_cubit.dart';
import 'package:malina_mobile_app/shared/configs/routes.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';
import '../../../restaurant_page/presentation/cubit/restaurant_controller.dart';

class FoodContainer extends StatelessWidget {
  final FoodModel food;
  const FoodContainer({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final extra = <String, Cubit>{
          'restaurantContCubit': context.read<RestaurantContCubit>(),
          'foodsCubit': context.read<FoodsCubit>(),
        };
        context.goNamed(
          RoutesNames.aboutFood,
          extra: extra,
          pathParameters: {
            'foodId': food.id.toString(),
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: borderR20,
          boxShadow: [
            smallShadow,
          ],
        ),
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 150.w,
                child: CachedWithDefaultImage(
                  imageUrl: food.image,
                  defautImage: 'assets/debug/foods/1.png',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      food.name,
                      style: h16,
                    ),
                    Text(
                      '${food.shortDescription} (${food.sizeOptions[0]} гр)',
                      style: st12,
                    ),
                    const FoodContainerCounter(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FoodContainerCounter extends StatefulWidget {
  const FoodContainerCounter({
    super.key,
  });

  @override
  State<FoodContainerCounter> createState() => _FoodContainerCounterState();
}

class _FoodContainerCounterState extends State<FoodContainerCounter> {
  int count = Random().nextInt(10) + 1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                count++;
              });
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: AppColor.lightGrey,
              child: Icon(
                Icons.add,
              ),
            ),
          ),
          Text(
            count.toString(),
            style: h16,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (count > 1) {
                  count--;
                }
              });
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: AppColor.lightGrey,
              child: Icon(
                Icons.remove,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
