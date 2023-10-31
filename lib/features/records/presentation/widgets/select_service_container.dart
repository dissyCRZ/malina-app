import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/service.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import '../cubit/selected_services_cont.dart';

class AddRecordSelectServicesContainer extends StatelessWidget {
  final ServiceModel service;
  const AddRecordSelectServicesContainer({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      margin: marginHV5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                service.name,
                style: h16,
              ),
              Row(
                children: [
                  Text(
                    '${service.timeMinutes.toStringAsFixed(0)} мин',
                    style: it16,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: CircleAvatar(
                      backgroundColor: AppColor.grey,
                      radius: 2,
                    ),
                  ),
                  Text(
                    '${service.price} C',
                    style: it16,
                  ),
                ],
              ),
            ],
          ),
          BlocBuilder<SelectedServicesContCubit, List<int>>(
            builder: (context, state) {
              final isChecked =
                  context.read<SelectedServicesContCubit>().isSelected(service.id);
              return GestureDetector(
                onTap: () {
                  context.read<SelectedServicesContCubit>().select(service.id);
                },
                child: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isChecked ? AppColor.green : AppColor.grey,
                      width: 1,
                    ),
                    color: isChecked ? AppColor.green : AppColor.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: isChecked
                      ? const Icon(
                          Icons.check,
                          color: AppColor.white,
                          size: 20,
                        )
                      : const SizedBox.shrink(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
