import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/barbershop_category_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/pages/beauty_shop.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/restaurant_category_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/pages/food_shop.dart';
import 'package:malina_mobile_app/features/home/data/enums/app_type.dart';
import 'package:malina_mobile_app/features/home/presentation/cubit/app_type_cubit.dart';
import 'package:malina_mobile_app/features/home/presentation/pages/not_registered.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BarbershopCategoryCubit()..load(),
        ),
        BlocProvider(
          create: (context) => RestaurantCategoryCubit()..load(),
        ),
      ],
      child: BlocBuilder<AppTypeCubit, AppType>(
        builder: (context, state) {
          if (state == AppType.food) {
            return const FoodShop();
          } else if (state == AppType.beauty) {
            return const BeautyShop();
          }
          return const NotRegisteredShop();
        },
      ),
    );
  }
}
