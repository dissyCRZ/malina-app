import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/widgets/wait_time_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';
import 'package:malina_mobile_app/shared/widgets/favourite_button.dart';
import '../../../restaurant_page/presentation/widgets/restaurant_stats.dart';
import '../../data/models/place.dart';

class RestaurantContainer extends StatelessWidget {
  final BusinessModel restaurant;
  const RestaurantContainer({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginHV8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          bigShadow,
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Hero(
                    tag: 'restaurant-page-image${restaurant.id}',
                    child: CachedWithDefaultImage(
                      imageUrl: restaurant.image,
                      defautImage: 'assets/images/not_found/restaurant.jpg',
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: WaitTimeContainer(
                  waitTime: restaurant.waitTime,
                ),
              ),
              BlocBuilder<FavouritesCubit, FavouritesState>(
                builder: (context, state) {
                  final isFavourite = context
                      .read<FavouritesCubit>()
                      .isFavourite(null, restaurant);
                  return Positioned(
                    top: 10,
                    right: 10,
                    child: FavouriteButton(
                      isFavourite: isFavourite ?? false,
                      function: () {
                        context.read<FavouritesCubit>().favouriteAction(
                              null,
                              restaurant,
                            );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          Hero(
            tag: 'restaurant-page-info${restaurant.id}',
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: [
                  bigShadow,
                ],
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(22),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: h20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PlaceStats(place: restaurant)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
