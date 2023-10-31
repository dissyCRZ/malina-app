import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import '../../../food_shop/data/models/place.dart';
import 'add_record_sheet_services_list.dart';

class AddRecordContainer extends StatelessWidget {
  final BusinessModel barbershop;
  final List<int> services;
  final SpecialistModel? specialist;
  const AddRecordContainer({
    Key? key,
    required this.barbershop,
    required this.services,
    this.specialist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      margin: marginHV5,
      padding: marginHV20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            barbershop.name,
            style: it16,
          ),
          AddRecordSheetServicesList(
            services: services,
            specialist: specialist,
          ),
        ],
      ),
    );
  }
}
