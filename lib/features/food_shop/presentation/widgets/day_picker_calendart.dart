import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/selected_date_cubit.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DayPickerCalendar extends StatelessWidget {
  DayPickerCalendar({super.key});
  final controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedDateCubit, DateTime>(
      builder: (context, state) {
        controller.selectedDate = state;
        return RoundedShadowContainer(
          padding: const EdgeInsets.all(20),
          margin: marginH,
          child: SfDateRangePicker(
            showNavigationArrow: true,
            selectionColor: AppColor.green,
            headerStyle: const DateRangePickerHeaderStyle(
              backgroundColor: AppColor.lightGrey,
            ),
            headerHeight: 45,
            controller: controller,
            onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
              context.read<SelectedDateCubit>().changeDate(
                    dateRangePickerSelectionChangedArgs.value,
                  );
            },
          ),
        );
      },
    );
  }
}
