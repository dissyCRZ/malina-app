import 'package:flutter/material.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Function? deleteAction;
  const CustomChip({
    Key? key,
    required this.label,
    this.deleteAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColor.lightGrey,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: st14,
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              if (deleteAction != null) {
                deleteAction!();
              }
            },
            child: const Icon(
              Icons.close,
              size: 15,
              color: AppColor.grey,
            ),
          )
        ],
      ),
    );
  }
}
