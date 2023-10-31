import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/guest_count_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class GuestCounter extends StatelessWidget {
  const GuestCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuestCountCubit, int>(
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                context.read<GuestCountCubit>().change(state - 1);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: borderR10,
                  color: AppColor.lightGrey,
                ),
                child: const Icon(
                  Icons.remove,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              state.toString(),
              style: h16,
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                context.read<GuestCountCubit>().change(state + 1);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: borderR10,
                  color: AppColor.lightGrey,
                ),
                child: const Icon(
                  Icons.add,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
