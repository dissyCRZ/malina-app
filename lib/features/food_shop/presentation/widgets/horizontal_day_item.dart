import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/selected_date_cubit.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';


class HorizontalDayItem extends StatelessWidget {
  final DateTime currentDate;
  final bool isSelected;
  final String dayName;
  const HorizontalDayItem({
    Key? key,
    required this.currentDate,
    required this.isSelected,
    required this.dayName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<SelectedDateCubit>().changeDate(currentDate),
      child: Container(
        height: 60,
        width: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.green : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColor.green : AppColor.grey,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayName.substring(0, 2),
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColor.white : AppColor.black,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              currentDate.day.toString(),
              style: TextStyle(
                fontSize: 16.0,
                color: isSelected ? AppColor.white : AppColor.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}