import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_controller.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/service.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/presentation/cubit/barbershop_specialist_controller.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/presentation/cubit/selected_service_cubit.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/presentation/widgets/barbershop_specialist_service_container.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/presentation/widgets/barbershop_specialist_sheet_data.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/presentation/widgets/barbershop_specialist_sheet_info.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_services_cubit.dart';
import 'package:malina_mobile_app/features/records/domain/utils/record_select_date_sheet.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';

class BarbershopSpecialistSheet extends StatelessWidget {
  final SpecialistModel specialist;
  const BarbershopSpecialistSheet({
    Key? key,
    required this.specialist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BarbershopSpecialistContCubit(specialist),
        ),
        BlocProvider(
          create: (context) => SelectedServiceCubit(),
        ),
      ],
      child: BottomSheetContainer(
        height: 750.h,
        hasPadding: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Специалист',
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
            const BarbershopSpecialistSheetData(),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: <Widget>[
                    Material(
                      elevation: 4,
                      shadowColor: AppColor.darkGrey.withOpacity(0.2),
                      child: Container(
                        padding: marginHV10,
                        width: double.infinity,
                        child: ButtonsTabBar(
                          center: false,
                          backgroundColor: AppColor.malina,
                          unselectedBorderColor: AppColor.grey,
                          borderColor: AppColor.malina,
                          borderWidth: 1,
                          unselectedBackgroundColor: AppColor.scaffold,
                          labelStyle: st16.copyWith(
                            color: AppColor.white,
                          ),
                          unselectedLabelStyle: st16,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          radius: 100,
                          tabs: const [
                            Tab(
                              height: 40,
                              text: 'Услуги',
                            ),
                            Tab(
                              height: 40,
                              text: 'Информация',
                            ),
                            Tab(
                              height: 40,
                              text: 'Работы',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          BlocBuilder<BeautyServicesCubit, List<ServiceModel>>(
                            builder: (context, state) {
                              final services = state
                                  .where(
                                    (element) =>
                                        element.specialistId == specialist.id,
                                  )
                                  .toList();
                              return ListView.builder(
                                itemBuilder: (context, index) =>
                                    BarbershopSpecialistServiceContainer(
                                  service: services[index],
                                ),
                                itemCount: services.length,
                              );
                            },
                          ),
                          const BarbershopSpecialistSheetInfo(),
                          GridView.builder(
                            padding: marginHV10,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                            ),
                            itemBuilder: (context, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                'assets/debug/specialist/${specialist.portfolio[index]}.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            itemCount: specialist.portfolio.length,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Builder(builder: (context) {
              return BlocBuilder<SelectedServiceCubit, SelectedServiceState>(
                builder: (context, state) {
                  final hasService = state is Selected;
                  return Padding(
                    padding: marginH,
                    child: MalinaFilledButton(
                      title: 'Записаться',
                      height: 60,
                      color: hasService ? AppColor.malina : AppColor.grey,
                      function: hasService
                          ? () {
                              addRecordSelectDateBottomSheet(
                                context,
                                context.read<BarbershopContCubit>().state,
                                specialist,
                                state.services.map((e) => e.id).toList(),
                              );
                            }
                          : () {},
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
