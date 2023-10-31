import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_specialists_cubit.dart';
import 'package:malina_mobile_app/features/records/domain/utils/record_select_date_sheet.dart';
import 'package:malina_mobile_app/features/records/presentation/widgets/add_record_specialist_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import '../../../food_shop/data/models/place.dart';

class AddRecordSelectSpecialist extends StatelessWidget {
  final List<int> services;
  final BusinessModel barbershop;
  const AddRecordSelectSpecialist({
    Key? key,
    required this.services,
    required this.barbershop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: marginHV10,
          child: Text(
            'Выберите специалиста',
            style: h18,
          ),
        ),
        GestureDetector(
          onTap: () {
            addRecordSelectDateBottomSheet(
              context,
              barbershop,
              context.read<BeautySpecialistsCubit>().state[0],
              services,
            );
          },
          child: const RoundedShadowContainer(
            margin: marginHV10,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Любой свободный специалист',
                  style: h16,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<BeautySpecialistsCubit, List<SpecialistModel>>(
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  addRecordSelectDateBottomSheet(
                    context,
                    barbershop,
                    state[index],
                    services,
                  );
                },
                child: AddRecordSpecialistContainer(
                  specialist: state[index],
                ),
              ),
              itemCount: state.length,
            );
          },
        )
      ],
    );
  }
}
