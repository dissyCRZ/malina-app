import 'package:flutter/material.dart';
import '../../../../shared/constants/colors.dart';

class SimpleSearchBar extends StatelessWidget {
  const SimpleSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      height: 50,
      decoration: const BoxDecoration(
        color: AppColor.softGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Поиск',
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
