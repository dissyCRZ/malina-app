import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/selected_barbershop_category.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/barbershop_category.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/barbershop_category_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/barbershops_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_product_category_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_products_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_service_category_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_services_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_specialist_category_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_specialists_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/widgets/barbershop_types.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/widgets/barbershops_list.dart';
import 'package:malina_mobile_app/features/home/presentation/widgets/home_search.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class BeautyShop extends StatelessWidget {
  const BeautyShop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BarbershopsCubit()..load(),
        ),
        BlocProvider(
          create: (context) => SelectedBarbershopCategory(
              context.read<BarbershopCategoryCubit>().state),
        ),
        BlocProvider(
          create: (context) => BeautyProductsCubit()..load(),
        ),
        BlocProvider(
          create: (context) => BeautyServicesCubit()..load(),
        ),
        BlocProvider(
          create: (context) => BeautySpecialistsCubit()..load(),
        ),
        BlocProvider(
          create: (context) => BeautyProductCategoryCubit()..load(),
        ),
        BlocProvider(
          create: (context) => BeautyServiceCategoryCubit()..load(),
        ),
        BlocProvider(
          create: (context) => BeautySpecialistCategoryCubit()..load(),
        ),
      ],
      child: Column(
        children: [
          const Padding(
            padding: appbarPadding,
            child: HomeSearchBar(),
          ),
          BlocBuilder<BarbershopCategoryCubit, List<BusinessCategoryModel>>(
            builder: (context, state) {
              return BarbershopTypes(
                tags: state,
              );
            },
          ),
          Builder(builder: (context) {
            return BlocBuilder<BarbershopsCubit, BarbershopsState>(
              builder: (context, state) {
                return BarbershopsList(
                  allBarbershops: state.barbershops,
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
