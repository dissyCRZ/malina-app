import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/restaurant_foods/domain/utils/get_extra_name.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/cubit/ingredients_cubit.dart';
import 'package:malina_mobile_app/features/restaurant_foods/presentation/widgets/add_ingredient_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/widgets/custom_chip.dart';


class ExtrasColumn extends StatelessWidget {
  const ExtrasColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Особые пожелания',
          style: h18,
        ),
        const SizedBox(
          height: 10,
        ),
        const AddIngredientContainer(),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<IngredientsCubit, IngredientsState>(
          builder: (context, state) {
            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(
                state.extras.length,
                (index) => CustomChip(
                  label: getExtraName(
                    state.extras[index],
                  ),
                  deleteAction: () {
                    context.read<IngredientsCubit>().removeExtra(
                          state.extras[index],
                        );
                  },
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
