import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/barbershop_category.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';

class BarbershopTypeContainer extends StatelessWidget {
  final BusinessCategoryModel tag;
  final bool isSelected;
  const BarbershopTypeContainer({
    Key? key,
    required this.tag,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipOval(
              child: CachedWithDefaultImage(
                imageUrl: tag.icon,
                defautImage: 'assets/debug/barbershops/1.jpg',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          tag.name,
          style: isSelected
              ? st12.copyWith(
                  color: AppColor.red,
                )
              : st12,
        ),
      ],
    );
  }
}
