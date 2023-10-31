import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';

class FavouriteButton extends StatelessWidget {
  final bool? isFavourite;
  final bool? hasShadow;
  final Function function;
  const FavouriteButton({
    Key? key,
    this.isFavourite,
    this.hasShadow,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: AppColor.white,
          shape: BoxShape.circle,
          boxShadow: hasShadow ?? false ? [smallShadow] : [],
        ),
        padding: const EdgeInsets.all(9),
        child: Image.asset(
          isFavourite ?? false
              ? 'assets/icons/heart-filled.png'
              : 'assets/icons/heart-outlined.png',
        ),
      ),
    );
  }
}
