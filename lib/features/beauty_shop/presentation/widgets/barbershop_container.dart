import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/widgets/wait_time_container.dart';
import 'package:malina_mobile_app/features/restaurant_page/presentation/widgets/restaurant_stats.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';
import 'package:malina_mobile_app/shared/widgets/favourite_button.dart';
import '../../../food_shop/data/models/place.dart';

class BarbershopContainer extends StatelessWidget {
  final BusinessModel barbershop;
  const BarbershopContainer({
    Key? key,
    required this.barbershop,
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
                    tag: 'barbershop-page-image${barbershop.id}',
                    child: CachedWithDefaultImage(
                      imageUrl: barbershop.image,
                      defautImage: 'assets/debug/barbershops/1.jpg',
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: WaitTimeContainer(
                  waitTime: barbershop.waitTime,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: FavouriteButton(
                  isFavourite: false,
                  function: () {},
                ),
              ),
            ],
          ),
          Container(
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
                  barbershop.name,
                  style: h20,
                ),
                const SizedBox(
                  height: 10,
                ),
                PlaceStats(
                  place: barbershop,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
