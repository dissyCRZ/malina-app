import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/service.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class AddRecordServiceContainer extends StatelessWidget {
  final ServiceModel service;
  final SpecialistModel? specialist;
  const AddRecordServiceContainer({
    Key? key,
    required this.service,
    this.specialist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          height: 20,
          thickness: 1,
          color: AppColor.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              service.name,
              style: h16,
            ),
            const Icon(
              Icons.close,
              size: 12,
            ),
          ],
        ),
        if (specialist != null)
          Text(
            'Специалист: ${specialist!.name}',
            style: it16,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${service.timeMinutes} мин',
              style: it16,
            ),
            Text(
              '${service.price} C',
              style: h16,
            ),
          ],
        ),
      ],
    );
  }
}
