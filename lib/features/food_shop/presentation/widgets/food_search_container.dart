import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/foods_cubit.dart';
import 'package:malina_mobile_app/features/home/presentation/widgets/home_search.dart';
import 'package:malina_mobile_app/shared/configs/routes.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class FoodSearchContainer extends StatelessWidget {
  const FoodSearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appbarPadding,
      child: GestureDetector(
        onTap: () {
          context.goNamed(
            RoutesNames.homeSearch,
            extra: context.read<FoodsCubit>(),
          );
        },
        child: const HomeSearchBar(
          isEnabled: false,
        ),
      ),
    );
  }
}
