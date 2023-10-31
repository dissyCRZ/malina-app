import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/barbershop_page/data/enums/barbershop_action.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_controller.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_product_cont.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_selected_services_cont.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_service_cont.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_specialist_cont.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/widgets/barbershop_bottom_action_sliver.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/widgets/barbershop_stats_sliver.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/widgets/barbershop_top_sliver.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/service.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_product_category_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_service_category_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_specialist_category_cubit.dart';
import 'package:malina_mobile_app/features/records/domain/utils/add_record_sheet.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import '../../../food_shop/data/models/place.dart';
import '../cubit/barbershop_action_cubit.dart';
import '../widgets/barbershop_page_tags.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class BarbershopPage extends StatelessWidget {
  final BusinessModel barbershop;
  const BarbershopPage({
    Key? key,
    required this.barbershop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BarbershopActionCubit(),
        ),
        BlocProvider(
          create: (context) => BarbershopContCubit(barbershop),
        ),
        BlocProvider(
          create: (context) => SelectedBeautyServiceCategory(
            context.read<BeautyServiceCategoryCubit>().state,
          ),
        ),
        BlocProvider(
          create: (context) => SelectedBeautySpecialistCategory(
            context.read<BeautySpecialistCategoryCubit>().state,
          ),
        ),
        BlocProvider(
          create: (context) => SelectedBeautyProductCategory(
            context.read<BeautyProductCategoryCubit>().state,
          ),
        ),
        BlocProvider(
          create: (context) => BarbershopSelectedServicesContCubit(),
        ),
      ],
      child: Stack(
        children: [
          Scaffold(
            key: _scaffoldKey,
            extendBody: true,
            backgroundColor: AppColor.white,
            extendBodyBehindAppBar: true,
            body: CustomScrollView(
              slivers: [
                const BarbershopTopSliver(),
                const BarbershopStatsSliver(),
                Builder(builder: (context) {
                  return BlocBuilder<BarbershopActionCubit,
                      BarbershopActionEnum>(
                    builder: (context, state) {
                      if (state == BarbershopActionEnum.services ||
                          state == BarbershopActionEnum.specialists ||
                          state == BarbershopActionEnum.products) {
                        return SliverAppBar(
                          pinned: true,
                          toolbarHeight: 34,
                          forceElevated: true,
                          elevation: 4,
                          shadowColor: AppColor.grey.withOpacity(0.25),
                          automaticallyImplyLeading: false,
                          flexibleSpace: const FlexibleSpaceBar(
                            titlePadding: EdgeInsets.zero,
                            title: BarbershopPageTags(),
                          ),
                        );
                      }
                      return const SliverToBoxAdapter();
                    },
                  );
                }),
                const BarbershopBottomActionSliver(),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20.w,
            child: Builder(builder: (context) {
              return BlocBuilder<BarbershopSelectedServicesContCubit,
                  List<ServiceModel>>(
                builder: (context, state) {
                  if (state.isNotEmpty) {
                    return MalinaFilledButton(
                      width: 350.w,
                      height: 60,
                      title: 'Записаться',
                      function: () {
                        addRecordServiceBottomSheet(
                          context,
                          barbershop,
                          state
                              .map(
                                (e) => e.id,
                              )
                              .toList(),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
