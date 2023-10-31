import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_controller.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/domain/utils/barbershop_specialist_sheet.dart';
import 'package:malina_mobile_app/features/records/domain/utils/add_record_specialist.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';
import '../../data/models/specialist.dart';

class BarbershopSpecialistContainer extends StatelessWidget {
  final SpecialistModel specialist;
  const BarbershopSpecialistContainer({
    Key? key,
    required this.specialist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final barbershop = context.read<BarbershopContCubit>().state;
        addRecordSpecialistBottomSheet(
          context,
          barbershop,
          specialist,
        );
      },
      child: Container(
        margin: marginHV8,
        height: 90,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            bigShadow,
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: double.infinity,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CachedWithDefaultImage(
                    imageUrl: specialist.imageUrl,
                    defautImage: 'assets/debug/specialist/1.jpg',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            specialist.name,
                            style: h16,
                          ),
                          Text(
                            specialist.category.name,
                            style: it14,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                barbershopSpecialistBottomSheet(
                                  context,
                                  specialist,
                                );
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    'Подрбнее',
                                    style: it14,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: AppColor.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColor.yellow,
                        ),
                        Text(
                          specialist.averageRating.toString(),
                          style: it14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
