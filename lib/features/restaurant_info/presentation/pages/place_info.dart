import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import 'package:malina_mobile_app/features/restaurant_info/presentation/widgets/restaurant_address.dart';
import 'package:malina_mobile_app/features/restaurant_info/presentation/widgets/restaurant_information.dart';
import 'package:malina_mobile_app/features/restaurant_page/presentation/cubit/restaurant_info_action_cont.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class PlaceInfo extends StatelessWidget {
  final BusinessModel place;
  const PlaceInfo({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantInfoActionCubit(),
      child: Builder(builder: (context) {
        return SliverToBoxAdapter(
          child: Container(
            width: 390.w,
            padding: marginH,
            child: BlocBuilder<RestaurantInfoActionCubit, int>(
              builder: (context, state) {
                final List<Widget> pages = [
                  PlaceInformation(
                    place: place,
                  ),
                  PlaceAddress(
                    place: place,
                  ),
                ];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        DefaultTabContainer(
                          isSelected: state == 0,
                          title: 'Информация',
                          index: 0,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        DefaultTabContainer(
                          isSelected: state == 1,
                          title: 'Адрес',
                          index: 1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    pages[state],
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}

class DefaultTabContainer extends StatelessWidget {
  final bool isSelected;
  final String title;
  final int index;
  const DefaultTabContainer({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<RestaurantInfoActionCubit>().change(
              index,
            );
      },
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.malina : AppColor.white,
          borderRadius: BorderRadius.circular(
            30,
          ),
          border: Border.all(
            color: isSelected ? AppColor.malina : AppColor.grey,
            width: 1,
          ),
        ),
        child: Text(
          title,
          style: isSelected ? h16white : h16,
        ),
      ),
    );
  }
}
