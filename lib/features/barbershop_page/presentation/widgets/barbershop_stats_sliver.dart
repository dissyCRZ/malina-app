import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_controller.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/widgets/barbershop_action_list.dart';
import 'package:malina_mobile_app/features/restaurant_page/presentation/widgets/restaurant_stats.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class BarbershopStatsSliver extends StatelessWidget {
  const BarbershopStatsSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final barbershop = context.read<BarbershopContCubit>().state;
    return SliverToBoxAdapter(
      child: Padding(
        padding: marginH,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              barbershop.addressName,
              style: st14,
            ),
            const SizedBox(
              height: 15,
            ),
            PlaceStats(
              place: barbershop,
            ),
            const BarbershopActionList(),
          ],
        ),
      ),
    );
  }
}
