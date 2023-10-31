import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        height: 26,
        width: 26,
        decoration: BoxDecoration(
          border: Border.all(
            color: isChecked ? AppColor.green : AppColor.grey,
            width: 1,
          ),
          color: isChecked ? AppColor.green : AppColor.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: isChecked
            ? const Icon(
                Icons.check,
                color: AppColor.white,
                size: 20,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
