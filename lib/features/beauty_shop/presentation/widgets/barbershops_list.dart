import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/selected_barbershop_category.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/pages/barbershop.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/barbershop_category.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_product_category_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_products_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_service_category_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_services_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_specialist_category_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_specialists_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/widgets/barbershop_container.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import 'package:malina_mobile_app/features/records/presentation/cubit/records_cubit.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';

class BarbershopsList extends StatelessWidget {
  final List<BusinessModel> allBarbershops;
  const BarbershopsList({
    Key? key,
    required this.allBarbershops,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beautyProductsCubit = context.read<BeautyProductsCubit>();
    final beautyServicesCubit = context.read<BeautyServicesCubit>();
    final beautySpecialistsCubit = context.read<BeautySpecialistsCubit>();
    final beautyProductCategoriesCubit =
        context.read<BeautyProductCategoryCubit>();
    final beautyServiceCategoriesCubit =
        context.read<BeautyServiceCategoryCubit>();
    final beautySpecialistCategoriesCubit =
        context.read<BeautySpecialistCategoryCubit>();
    final recordsCubit = context.read<RecordsCubit>();
    return Expanded(
      child: BlocBuilder<SelectedBarbershopCategory, BusinessCategoryModel>(
        builder: (context, state) {
          List<BusinessModel> barbershops = [];
          if (state.name == allOfThemString) {
            barbershops = allBarbershops;
          } else {
            barbershops = allBarbershops
                .where(
                  (e) => e.category == state.id,
                )
                .toList();
          }
          return ListView.builder(
            itemBuilder: (context, index) => OpenContainer(
              routeSettings: const RouteSettings(name: 'barbershop'),
              transitionType: ContainerTransitionType.fade,
              transitionDuration: const Duration(milliseconds: 400),
              openBuilder: (context, _) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: beautyProductsCubit,
                  ),
                  BlocProvider.value(
                    value: beautyServicesCubit,
                  ),
                  BlocProvider.value(
                    value: beautySpecialistsCubit,
                  ),
                  BlocProvider.value(
                    value: recordsCubit,
                  ),
                  BlocProvider.value(
                    value: beautyProductCategoriesCubit,
                  ),
                  BlocProvider.value(
                    value: beautyServiceCategoriesCubit,
                  ),
                  BlocProvider.value(
                    value: beautySpecialistCategoriesCubit,
                  ),
                ],
                child: BarbershopPage(
                  barbershop: barbershops[index],
                ),
              ),
              closedBuilder: (context, _) => BarbershopContainer(
                barbershop: barbershops[index],
              ),
            ),
            itemCount: barbershops.length,
          );
        },
      ),
    );
  }
}
