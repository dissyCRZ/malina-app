import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class ScanContainer extends StatelessWidget {
  const ScanContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: marginHV10,
      decoration: BoxDecoration(
        color: AppColor.malina,
        borderRadius: borderR12,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 25,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/main/phone-scan.png',
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 240.w,
            child: Text(
              'Сканируй QR-код и заказывай прямо в заведении',
              style: h16.copyWith(
                color: AppColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
