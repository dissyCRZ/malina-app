import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/service.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_services_cubit.dart';
import 'package:malina_mobile_app/features/records/data/models/record.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/utils/date_time_extension.dart';
import 'package:malina_mobile_app/shared/utils/get_last_numbers.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import 'record_service_container.dart';

class MyRecordContainer extends StatelessWidget {
  final RecordModel record;
  const MyRecordContainer({
    Key? key,
    required this.record,
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
              'Запись № ${getLastNumber(record.id.toString(), 6)}',
              style: h16,
            ),
            const Divider(
              thickness: 1,
              color: AppColor.grey,
              height: 20,
            ),
            Text(
              record.place.name,
              style: h18,
            ),
            const Text(
              'Проспект Манаса, 51 ',
              style: it12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Row(
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
                    record.time.timedayMonthYear(context),
                    style: h18,
                  ),
                ],
              ),
            ),
            BlocBuilder<BeautyServicesCubit, List<ServiceModel>>(
              builder: (context, state) {
                final services = state
                    .where(
                      (element) => record.services.any(
                        (e) => e == element.id,
                      ),
                    )
                    .toList();
                if (services.isNotEmpty) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => MyRecordServiceContainer(
                      service: services[index],
                      specialistName: record.specialist.name,
                      type: record.type,
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColor.grey,
                      height: 25,
                      thickness: 1,
                    ),
                    itemCount: record.services.length,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ));
  }
}
