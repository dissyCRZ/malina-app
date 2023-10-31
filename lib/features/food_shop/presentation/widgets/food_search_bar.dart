import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/search_controller.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import '../../../../shared/constants/colors.dart';

class FoodSearchBar extends StatelessWidget {
  final bool? isEnabled;
  FoodSearchBar({
    Key? key,
    this.isEnabled,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();

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
        controller: controller,
        enabled: isEnabled,
        onChanged: (value) {
          context.read<SearchContCubit>().change(controller.text);
        },
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
