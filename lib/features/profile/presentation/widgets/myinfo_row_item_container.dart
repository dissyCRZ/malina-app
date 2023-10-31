import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/profile/presentation/cubit/myinfo_controller.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class MyInfoRowItemContainer extends StatelessWidget {
  final String title;
  final String value;
  final int index;

  const MyInfoRowItemContainer({
    Key? key,
    required this.title,
    required this.value,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.read<MyInfoSheetContCubit>().change(index);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: it14,
                  ),
                  Text(
                    value,
                    style: h18,
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColor.grey,
                size: 15,
              ),
            ],
          ),
          const Divider(
            height: 15,
            thickness: 1,
            color: AppColor.grey,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
