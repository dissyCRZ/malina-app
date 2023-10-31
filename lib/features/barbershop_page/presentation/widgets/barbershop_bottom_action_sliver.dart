import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_page/data/enums/barbershop_action.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_action_cubit.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_controller.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/widgets/barbershop_products_sliver.dart';
import 'package:malina_mobile_app/features/restaurant_info/presentation/pages/place_info.dart';
import 'barbershop_service_sliver.dart';
import 'barbershop_specialist_sliver.dart';

class BarbershopBottomActionSliver extends StatelessWidget {
  const BarbershopBottomActionSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarbershopActionCubit, BarbershopActionEnum>(
      builder: (context, state) {
        if (state == BarbershopActionEnum.specialists) {
          return const BarbershopSpecialistSliver();
        } else if (state == BarbershopActionEnum.services) {
          return const BarbershopServiceSliver();
        } else if (state == BarbershopActionEnum.products) {
          return const BarbershopProductsSliver();
        } else if (state == BarbershopActionEnum.info) {
          return PlaceInfo(
            place: context.read<BarbershopContCubit>().state,
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
