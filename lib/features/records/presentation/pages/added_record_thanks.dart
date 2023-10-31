import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/records/domain/utils/records_sheet.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/utils/get_last_numbers.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';

class AddedRecordThanksSheet extends StatelessWidget {
  final String id;
  const AddedRecordThanksSheet({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 750.h,
      hasPadding: false,
      child: Column(
        children: [
          Padding(
            padding: marginHV20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(),
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
          ),
          RoundedShadowContainer(
            width: double.infinity,
            margin: marginHV10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/emoji/face-thumbs-up.png',
                  height: 110.h,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Бронирование стола успешно сохранено!',
                  style: h22,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: marginH,
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: borderR12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Запись № ${getLastNumber(
                          id,
                          6,
                        )}',
                        style: st16,
                      ),
                      Image.asset(
                        'assets/icons/time.png',
                        height: 18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'Статус записи можно проверить в личном кабинете в разделе',
                    style: st14,
                    children: [
                      TextSpan(
                        text: ' Мои записи',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pop();
                            recordsBottomSheet(
                              context,
                            );
                          },
                        style: st14.copyWith(
                          color: AppColor.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
