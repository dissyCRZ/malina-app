import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:malina_mobile_app/features/favourites/presentation/widgets/empty_state.dart';
import 'package:malina_mobile_app/features/favourites/presentation/widgets/food_container.dart';
import 'package:malina_mobile_app/features/favourites/presentation/widgets/product_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import '../../../food_shop/presentation/widgets/restaurant_container.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: appbarPadding,
          child: Text(
            'Избранное',
            style: h20,
          ),
        ),
        BlocBuilder<FavouritesCubit, FavouritesState>(
          builder: (context, state) {
            if (state is FavouritesLoaded) {
              return Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: marginH,
                        width: double.infinity,
                        child: ButtonsTabBar(
                          center: false,
                          backgroundColor: AppColor.malina,
                          unselectedBorderColor: AppColor.grey,
                          borderColor: AppColor.malina,
                          borderWidth: 1,
                          unselectedBackgroundColor: AppColor.scaffold,
                          labelStyle: st16.copyWith(color: AppColor.white),
                          unselectedLabelStyle: st16,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          radius: 100,
                          tabs: const [
                            Tab(
                              height: 40,
                              text: 'Еда',
                            ),
                            Tab(
                              height: 40,
                              text: 'Товары',
                            ),
                            Tab(
                              height: 40,
                              text: 'Места',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            ListView.builder(
                              itemBuilder: (context, index) =>
                                  FavouriteFoodContainer(
                                food: state.foods[index],
                              ),
                              itemCount: state.foods.length,
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) =>
                                  FavouriteProductContainer(
                                product: state.products[index],
                              ),
                              itemCount: state.products.length,
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) =>
                                  RestaurantContainer(
                                restaurant: state.restaurants[index],
                              ),
                              itemCount: state.restaurants.length,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const FavouritesEmptyState();
          },
        ),
      ],
    );
  }
}
