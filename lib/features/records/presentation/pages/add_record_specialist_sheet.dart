import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_services_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_specialists_cubit.dart';
import 'package:malina_mobile_app/features/records/domain/utils/record_select_date_sheet.dart';
import 'package:malina_mobile_app/features/records/presentation/cubit/selected_services_cont.dart';
import 'package:malina_mobile_app/features/records/presentation/widgets/add_record_select_services.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import '../../../food_shop/data/models/place.dart';

class AddRecordSpecialistSheet extends StatelessWidget {
  final SpecialistModel specialist;
  final BusinessModel barbershop;
  const AddRecordSpecialistSheet({
    Key? key,
    required this.specialist,
    required this.barbershop,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectedServicesContCubit(),
        ),
        BlocProvider(
          create: (context) => BeautyServicesCubit()..load(),
        ),
        BlocProvider(
          create: (context) => BeautySpecialistsCubit()..load(),
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
                        'Детали записи',
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
                        RoundedShadowContainer(
                          margin: marginHV5,
                          padding: marginHV20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                barbershop.name,
                                style: it18,
                              ),
                              const Divider(
                                height: 6,
                                color: AppColor.grey,
                                thickness: 1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Специалист: //${specialist.name}',
                                style: it16,
                              ),
                            ],
                          ),
                        ),
                        AddRecordSelectServices(
                          specialist: specialist,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<SelectedServicesContCubit, List<int>>(
            builder: (context, state) {
              final isEmpty = state.isEmpty;
              return Positioned(
                bottom: 10,
                left: 20.w,
                child: MalinaFilledButton(
                    width: 350.w,
                    height: 60,
                    color: isEmpty ? AppColor.lightGrey : AppColor.malina,
                    textColor: isEmpty ? AppColor.darkGrey : AppColor.white,
                    title: 'Выбрать дату',
                    function: isEmpty
                        ? null
                        : () {
                            addRecordSelectDateBottomSheet(
                              context,
                              barbershop,
                              specialist,
                              state,
                            );
                          }),
              );
            },
          ),
        ],
      ),
    );
  }
}
