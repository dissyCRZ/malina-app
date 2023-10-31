import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_service_cont.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_tag.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_services_cubit.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';
import 'barbershop_service_container.dart';

class BarbershopServiceSliver extends StatelessWidget {
  const BarbershopServiceSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final allServices = context.read<BeautyServicesCubit>().state;
    return BlocBuilder<SelectedBeautyServiceCategory, BeautyTagModel>(
      builder: (context, state) {
        final services = state.name == allOfThemString
            ? allServices
            : allServices
                .where(
                  (element) => element.category.id == state.id,
                )
                .toList();
        return SliverPadding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 80.h,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => BarbershopServiceContainer(
                service: services[index],
              ),
              childCount: services.length,
            ),
          ),
        );
      },
    );
  }
}
