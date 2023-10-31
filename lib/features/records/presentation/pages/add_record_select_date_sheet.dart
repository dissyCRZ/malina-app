import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/calendar_visibility.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/selected_date_cubit.dart';
import 'package:malina_mobile_app/features/records/domain/utils/record_comment_sheet.dart';
import 'package:malina_mobile_app/features/records/presentation/widgets/add_record_container.dart';
import 'package:malina_mobile_app/features/records/presentation/widgets/add_record_sheet_time_selection.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import '../../../food_shop/data/models/place.dart';

class AddRecordSelectDateSheet extends StatelessWidget {
  final List<int> services;
  final SpecialistModel specialist;
  final BusinessModel barbershop;
  const AddRecordSelectDateSheet({
    Key? key,
    required this.services,
    required this.specialist,
    required this.barbershop,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalendarVisibilityCubit(),
        ),
        BlocProvider(
          create: (context) => SelectedDateCubit(),
        ),
      ],
      child: Stack(
        children: [
          BottomSheetContainer(
            height: 750.h,
            hasPadding: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: marginHV20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Выбрать дату',
                        style: h20,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: const Icon(
                          Icons.close,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AddRecordContainer(
                          barbershop: barbershop,
                          services: services,
                          specialist: specialist,
                        ),
                        const AddRecordSheetTimeSelection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20.w,
            child: Builder(
              builder: (context) {
                return MalinaFilledButton(
                  width: 350.w,
                  height: 60,
                  title: 'Записаться',
                  function: () async {
                    addRecordCommentBottomSheet(
                      context,
                      barbershop,
                      specialist,
                      context.read<SelectedDateCubit>().state,
                      services,
                    );
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
