import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_controller.dart';
import 'package:malina_mobile_app/features/barbershop_products/presentation/pages/product.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_products_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/foods_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/pages/food_search.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/pages/individual_food.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/pages/food.dart';
import '../../features/main/presentation/pages/main_scaffold.dart';
import '../../features/restaurant_page/presentation/cubit/restaurant_controller.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
  }
}

class Routes {
  static String main = '/';

  static String aboutFood = 'aboutFood/:foodId';
  static String aboutProduct = 'aboutProduct/:productId';

  static String homeSearch = 'homeSearch';
  static String searchFood = 'searchFood/:foodId';

  static String login = '/login';
  static String onboarding = '/onboarding';
}

class RoutesNames {
  static String main = 'main';

  static String aboutFood = 'aboutFood';
  static String aboutProduct = 'aboutProduct';

  static String homeSearch = 'homeSearch';
  static String searchFood = 'searchFood';

  static String login = 'login';
  static String onboarding = 'onboarding';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.main,
      name: RoutesNames.main,
      builder: (context, state) => const MainScaffold(),
      routes: [
        GoRoute(
          path: Routes.aboutFood,
          name: RoutesNames.aboutFood,
          builder: (context, state) {
            final cubits = state.extra as Map<String, Cubit>;
            final restaurantContCubit =
                cubits['restaurantContCubit'] as RestaurantContCubit;
            final foodsCubit = cubits['foodsCubit'] as FoodsCubit;
            final foodId = int.parse(state.pathParameters['foodId']!);
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: foodsCubit,
                ),
                BlocProvider.value(
                  value: restaurantContCubit,
                ),
              ],
              child: AboutFoodPage(foodId: foodId),
            );
          },
        ),
        GoRoute(
          path: Routes.aboutProduct,
          name: RoutesNames.aboutProduct,
          builder: (context, state) {
            final cubits = state.extra as Map<String, Cubit>;
            final barbershopContCubit =
                cubits['barbershopContCubit'] as BarbershopContCubit;
                 final beautyProductsCubit = cubits['beautyProductsCubit'] as BeautyProductsCubit;
            final productId = int.parse(state.pathParameters['productId']!);
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: barbershopContCubit,
                ),
                BlocProvider.value(
                  value: beautyProductsCubit,
                ),
              ],
              child: BarbershopProductPage(
                productId: productId,
              ),
            );
          },
        ),
        GoRoute(
            path: Routes.homeSearch,
            name: RoutesNames.homeSearch,
            builder: (context, state) {
              final foodsCubit = state.extra as FoodsCubit;
              return BlocProvider.value(
                value: foodsCubit,
                child: const FoodSearchPage(),
              );
            },
            routes: [
              GoRoute(
                path: Routes.searchFood,
                name: RoutesNames.searchFood,
                builder: (context, state) {
                  final foodsCubit = state.extra as FoodsCubit;
                           final foodId = int.parse(state.pathParameters['foodId']!);

                  return BlocProvider.value(
                    value: foodsCubit,
                    child: IndividualSearchFoodPage(
                      foodId: foodId,
                    ),
                  );
                },
              ),
            ]),
      ],
    ),

    //* Login
  ],
);
