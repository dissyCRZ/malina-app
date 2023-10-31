import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/service.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_services_cubit.dart';
import 'package:malina_mobile_app/features/records/presentation/widgets/select_service_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class AddRecordSelectServices extends StatelessWidget {
  final SpecialistModel specialist;
  const AddRecordSelectServices({
    Key? key,
    required this.specialist,
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
            'Выберите услугу',
            style: h18,
          ),
        ),
        BlocBuilder<BeautyServicesCubit, List<ServiceModel>>(
          builder: (context, state) {
            final services = state
                .where(
                  (element) => element.specialistId == specialist.id,
                )
                .toList();
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => AddRecordSelectServicesContainer(
                service: services[index],
              ),
              itemCount: services.length,
            );
          },
        ),
        SizedBox(
          height: 80.h,
        ),
      ],
    );
  }
}
