import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import '../../../../shared/constants/colors.dart';

class HomeSearchBar extends StatelessWidget {
  final bool? isEnabled;
  const HomeSearchBar({
    Key? key,
    this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: AppColor.softGrey,
        boxShadow: [
          bigShadow,
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: TextField(
        enabled: isEnabled,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Искать в Malina',
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Container(
            height: 15,
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset(
              'assets/icons/search.png',
              color: AppColor.darkGrey,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 20,
          ),
        ),
      ),
    );
  }
}
