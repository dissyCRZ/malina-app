import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/restaurant_page/data/enums/restaurant_action.dart';
import 'package:malina_mobile_app/features/food_shop/domain/utils/booking_sheet.dart';
import 'package:malina_mobile_app/features/food_shop/domain/utils/get_action.dart';
import '../cubit/restaurant_action_cubit.dart';
import '../cubit/restaurant_controller.dart';
import 'restaurant_action_button.dart';

class RestaurantActionList extends StatefulWidget {
  const RestaurantActionList({
    super.key,
  });

  @override
  State<RestaurantActionList> createState() => _RestaurantActionListState();
}

class _RestaurantActionListState extends State<RestaurantActionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
      child: BlocBuilder<RestaurantActionCubit, RestaurantActionEnum>(
        builder: (context, state) {
          return ListView.separated(
            clipBehavior: Clip.none,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                context.read<RestaurantActionCubit>().change(
                      RestaurantActionEnum.values.elementAt(
                        index,
                      ),
                    );
                if (index == 1) {
                  bookingBottomSheet(
                    context,
                    context.read<RestaurantContCubit>().state,
                  );
                }
              },
              child: RestaunrantActionButton(
                title: getActionName(
                  RestaurantActionEnum.values.elementAt(index),
                ),
                icon: getActionIcon(
                  RestaurantActionEnum.values.elementAt(index),
                ),
                isSelected:
                    state == RestaurantActionEnum.values.elementAt(index),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: RestaurantActionEnum.values.length,
            scrollDirection: Axis.horizontal,
          );
        },
      ),
    );
  }
}
