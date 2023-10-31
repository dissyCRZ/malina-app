import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/service.dart';
import 'package:malina_mobile_app/features/records/data/enums/record_type.dart';
import 'package:malina_mobile_app/features/records/domain/utils/get_record_type_name.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class MyRecordServiceContainer extends StatelessWidget {
  const MyRecordServiceContainer({
    Key? key,
    required this.service,
    required this.specialistName,
    required this.type,
  }) : super(key: key);

  final ServiceModel service;
  final String specialistName;
  final RecordTypeEnum type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service.category.name,
          style: h16,
        ),
        Text(
          'Специалист: $specialistName',
          style: it16,
        ),
        Text(
          '${service.timeMinutes.toStringAsFixed(0)} мин * ${service.price} С',
          style: it16,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 46,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.softGrey,
            borderRadius: borderR10,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 3.5,
                backgroundColor: AppColor.green,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                getRecordTypeName(
                  type,
                ),
                style: st14.copyWith(
                  color: AppColor.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
