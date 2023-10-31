// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/utils/date_time_extension.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

import '../../../../shared/configs/texts.dart';
import 'add_record_sheet_services_list.dart';

class RecordCommentServicesList extends StatelessWidget {
  final List<int> services;
  final SpecialistModel specialist;
  final BusinessModel business;
  final DateTime time;
  const RecordCommentServicesList({
    Key? key,
    required this.services,
    required this.specialist,
    required this.business,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      padding: marginHV20,
      margin: marginHV8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            business.name,
            style: it16,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: borderR6,
                  color: AppColor.lightGrey,
                ),
                padding: const EdgeInsets.all(7),
                child: Image.asset(
                  'assets/icons/calendar-outlined.png',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                time.localizedTimeOfDay(context),
                style: st14,
              ),
            ],
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
