import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/presentation/cubit/barbershop_specialist_controller.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';

class BarbershopSpecialistSheetData extends StatelessWidget {
  const BarbershopSpecialistSheetData({super.key});

  @override
  Widget build(BuildContext context) {
    final specialist = context.read<BarbershopSpecialistContCubit>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 90.w,
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
              child: Column(
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
                  const SizedBox(
                    height: 10,
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
