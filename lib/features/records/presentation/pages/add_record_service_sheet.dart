import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/records/presentation/widgets/add_record_container.dart';
import 'package:malina_mobile_app/features/records/presentation/widgets/add_record_select_specialist.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import '../../../food_shop/data/models/place.dart';

class AddRecordServiceSheet extends StatelessWidget {
  final List<int> services;
  final BusinessModel barbershop;
  const AddRecordServiceSheet({
    Key? key,
    required this.services,
    required this.barbershop,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 750.h,
      hasPadding: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: marginHV20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Детали записи',
                  style: h20,
                ),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: const Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AddRecordContainer(
                    barbershop: barbershop,
                    services: services,
                  ),
                  AddRecordSelectSpecialist(
                    barbershop: barbershop,
                    services: services,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
