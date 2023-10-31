import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/service.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/presentation/cubit/selected_service_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

class BarbershopSpecialistServiceContainer extends StatelessWidget {
  final ServiceModel service;
  const BarbershopSpecialistServiceContainer({
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
          BlocBuilder<SelectedServiceCubit, SelectedServiceState>(
            builder: (context, state) {
              final isSelected = state is Selected &&
                  state.services.any(
                    (element) => element.id == service.id,
                  );
              return GestureDetector(
                onTap: () {
                  context.read<SelectedServiceCubit>().select(
                        service,
                      );
                },
                child: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? AppColor.green : AppColor.grey,
                      width: 1,
                    ),
                    color: isSelected ? AppColor.green : AppColor.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: isSelected
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
