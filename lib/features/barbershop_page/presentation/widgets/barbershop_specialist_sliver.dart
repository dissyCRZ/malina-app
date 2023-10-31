import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_specialist_cont.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/presentation/widgets/barbershop_specialist_container.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_tag.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_specialists_cubit.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';

class BarbershopSpecialistSliver extends StatelessWidget {
  const BarbershopSpecialistSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final allSpecialists = context.read<BeautySpecialistsCubit>().state;
    return BlocBuilder<SelectedBeautySpecialistCategory, BeautyTagModel>(
      builder: (context, state) {
        final specialists = state.name == allOfThemString
            ? allSpecialists
            : allSpecialists
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
              (context, index) => BarbershopSpecialistContainer(
                specialist: specialists[index],
              ),
              childCount: specialists.length,
            ),
          ),
        );
      },
    );
  }
}
