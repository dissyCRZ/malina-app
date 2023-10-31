import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/service.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_services_cubit.dart';
import 'package:malina_mobile_app/features/records/presentation/widgets/add_record_sheet_service_container.dart';
import '../../../../shared/constants/colors.dart';

class AddRecordSheetServicesList extends StatefulWidget {
  final List<int> services;
  final SpecialistModel? specialist;
  const AddRecordSheetServicesList({
    Key? key,
    required this.services,
    this.specialist,
  }) : super(key: key);

  @override
  State<AddRecordSheetServicesList> createState() =>
      _AddRecordSheetServicesListState();
}

class _AddRecordSheetServicesListState
    extends State<AddRecordSheetServicesList> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    bool hasThree = widget.services.length >= 2;
    return AnimatedSize(
      duration: const Duration(
        milliseconds: 300,
      ),
      child: Column(
        children: [
          BlocBuilder<BeautyServicesCubit, List<ServiceModel>>(
            builder: (context, state) {
              final services = state
                  .where(
                    (element) => widget.services.any(
                      (e) => e == element.id,
                    ),
                  )
                  .toList();
              if (services.isNotEmpty) {
                return ListView.separated(
                  itemBuilder: (context, index) => AddRecordServiceContainer(
                    service: services[index],
                    specialist: widget.specialist,
                  ),
                  itemCount: isExpanded
                      ? widget.services.length
                      : hasThree
                          ? 2
                          : widget.services.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          if (widget.services.length > 2)
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: AnimatedCrossFade(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Image.asset(
                    'assets/icons/double-up.png',
                    width: 15,
                    color: AppColor.grey,
                  ),
                  secondChild: Image.asset(
                    'assets/icons/double-down.png',
                    width: 15,
                    color: AppColor.grey,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
