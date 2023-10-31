import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/foods_cubit.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/foods_state.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/search_controller.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/widgets/food_search_bar.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/simple_appbar.dart';
import '../widgets/food_search_list.dart';

class FoodSearchPage extends StatelessWidget {
  const FoodSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchContCubit(),
      child: KeyboardDismisser(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: getAppBar(
            context,
            'Еда',
          ),
          body: Padding(
            padding: marginH,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FoodSearchBar(),
                BlocBuilder<FoodsCubit, FoodsState>(
                  builder: (context, state) {
                    return FoodSearchList(
                      allFoods: state.foods,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
