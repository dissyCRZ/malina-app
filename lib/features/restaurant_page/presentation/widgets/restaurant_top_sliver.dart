import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';
import '../cubit/restaurant_controller.dart';
import 'restaurant_appbar_items.dart';

class RestaurantTopSliver extends StatelessWidget {
  const RestaurantTopSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final restaurant = context.read<RestaurantContCubit>().state;
    return SliverAppBar(
      backgroundColor: AppColor.white,
      pinned: true,
      elevation: 0,
      title: const RestaurantTopSliverTitle(),
      automaticallyImplyLeading: false,
      expandedHeight: 390.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: 'restaurant-page-image${restaurant.id}',
          child: CachedWithDefaultImage(
            imageUrl: restaurant.image,
            defautImage: 'assets/images/not_found/restaurant.jpg',
          ),
        ),
      ),
      floating: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: RestaurantTopSliverBottom(),
      ),
    );
  }
}

class RestaurantTopSliverBottom extends StatelessWidget {
  const RestaurantTopSliverBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final restaurant = context.read<RestaurantContCubit>().state;
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Image.asset(
              'assets/icons/back.png',
              height: 12,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              restaurant.name,
              style: h18,
            ),
          ),
          SizedBox(
            width: 120.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const RestaurantAppBarItem(
                  icon: 'search',
                ),
                const RestaurantAppBarItem(
                  icon: 'upload',
                ),
                BlocBuilder<FavouritesCubit, FavouritesState>(
                  builder: (context, state) {
                    final isFavourite = context
                        .read<FavouritesCubit>()
                        .isFavourite(null, restaurant);
                    return RestaurantAppBarItem(
                      icon: isFavourite ?? false
                          ? 'heart-filled'
                          : 'heart-outlined',
                      function: () {
                        context
                            .read<FavouritesCubit>()
                            .favouriteAction(null, restaurant);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantTopSliverTitle extends StatelessWidget {
  const RestaurantTopSliverTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final restaurant = context.read<RestaurantContCubit>().state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RestaurantAppBarItem(
          icon: 'back',
          function: () {
            context.pop();
          },
        ),
        SizedBox(
          width: 120.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const RestaurantAppBarItem(
                icon: 'search',
              ),
              const RestaurantAppBarItem(
                icon: 'upload',
              ),
              BlocBuilder<FavouritesCubit, FavouritesState>(
                builder: (context, state) {
                  final isFavourite = context
                      .read<FavouritesCubit>()
                      .isFavourite(null, restaurant);
                  return RestaurantAppBarItem(
                    icon: isFavourite ?? false
                        ? 'heart-filled'
                        : 'heart-outlined',
                    function: () {
                      context
                          .read<FavouritesCubit>()
                          .favouriteAction(null, restaurant);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
