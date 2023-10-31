import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/cubit/ingredients_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/add_ingredients_bottom_sheet.dart';

Future<dynamic> addIngredientsModalSheet(BuildContext buildContext, String name,) {
  return showModalBottomSheet(
    context: buildContext,
    isScrollControlled: true,
    builder: (context) => BlocProvider.value(
      value: BlocProvider.of<IngredientsCubit>(buildContext),
      child: AddIngredientsBottomSheet(
        name: name,
      ),
    ),
  );
}
