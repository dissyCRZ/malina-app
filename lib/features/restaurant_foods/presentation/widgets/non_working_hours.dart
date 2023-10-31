import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import '../../../../shared/configs/texts.dart';

class NonWorkingHoursSheet extends StatelessWidget {
  const NonWorkingHoursSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 350.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
            child: Image.asset('assets/images/emoji/saluting-hand.png'),
          ),
          const SizedBox(
            height: 15,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Нерабочее время',
                style: h24,
              ),
              Text(
                'Мы скоро закроемся, но вы сможете сделать заказ в Malina, как только мы вернемся к работе',
                style: st14,
              ),
            ],
          ),
          const Spacer(),
          MalinaFilledButton(
            title: 'Хорошо',
            function: () {
              context.pop();
            },
          )
        ],
      ),
    );
  }
}
