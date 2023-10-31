import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

class AddRecordSpecialistContainer extends StatelessWidget {
  final SpecialistModel specialist;
  const AddRecordSpecialistContainer({
    Key? key,
    required this.specialist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      height: 90,
      padding: EdgeInsets.zero,
      margin: marginHV5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        specialist.name,
                        style: h16,
                      ),
                      Text(
                        specialist.category.name,
                        style: it14,
                      ),
                      const Row(
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
                    ],
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
    );
  }
}
