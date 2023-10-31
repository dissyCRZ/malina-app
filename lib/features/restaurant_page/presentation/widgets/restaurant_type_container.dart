import 'dart:math';
import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/barbershop_category.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/cached_with_default_image.dart';

class RestaurantTypeContainer extends StatefulWidget {
  final BusinessCategoryModel tag;
  final bool isSelected;
  const RestaurantTypeContainer({
    Key? key,
    required this.tag,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<RestaurantTypeContainer> createState() =>
      _RestaurantTypeContainerState();
}

class _RestaurantTypeContainerState extends State<RestaurantTypeContainer> {
  late final int image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipOval(
              child: CachedWithDefaultImage(
                imageUrl: widget.tag.icon,
                defautImage: 'assets/debug/foods/1.png',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.tag.name,
          style: widget.isSelected
              ? st12.copyWith(
                  color: AppColor.red,
                )
              : st12,
        ),
      ],
    );
  }
}
