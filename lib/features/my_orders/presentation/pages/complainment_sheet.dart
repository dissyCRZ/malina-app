import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/complainment_thanks_sheet.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/grey_filled_button.dart';
import 'package:malina_mobile_app/shared/widgets/outlined_multiline_field.dart';

class ComplainmentSheet extends StatelessWidget {
  final BusinessModel place;
  const ComplainmentSheet({
    Key? key,
    required this.place,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 750.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Пожаловаться',
                style: h20,
              ),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: const Icon(
                  Icons.close,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                place.name,
                style: h24,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Введите причину жалобы',
                style: st18,
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedMultilineField(
                controller: TextEditingController(),
              ),
            ],
          ),
          const Spacer(),
          GreyFilledButton(
            title: 'Отправить жалобу',
            color: AppColor.black,
            function: () {
              context.pop();
              complainmentThanksBottomSheet(
                context,
              );
            },
          ),
        ],
      ),
    );
  }
}
