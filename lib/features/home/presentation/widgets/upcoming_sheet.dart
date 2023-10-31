import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import '../../../../shared/configs/texts.dart';

class UpcomingSoonSheet extends StatelessWidget {
  const UpcomingSoonSheet({
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
            child: Image.asset('assets/images/emoji/hugging-face.png'),
          ),
          const SizedBox(
            height: 15,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Скоро будет доступно',
                style: h24,
              ),
              Text(
                'Мы уже работаем над этим',
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
