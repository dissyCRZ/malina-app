import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import 'package:malina_mobile_app/features/restaurant_info/presentation/widgets/social_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import 'package:malina_mobile_app/shared/widgets/simple_yandex_location.dart';

class PlaceAddress extends StatelessWidget {
  final BusinessModel place;
  const PlaceAddress({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 320.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Адрес',
                style: h18,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                place.addressName,
                style: st14,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                place.phoneNumber ?? '',
                style: st14,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SimpleYandexMap(
          location: place.coordinates,
        ),
        const SizedBox(
          height: 10,
        ),
        const MalinaFilledButton(
          title: 'Проложить маршрут',
          color: AppColor.lightGrey,
          height: 60,
          textColor: AppColor.grey,
        ),
        const MalinaFilledButton(
          title: 'Вызвать такси',
          color: AppColor.lightGrey,
          height: 60,
          textColor: AppColor.grey,
        ),
        const SocialContainer(),
      ],
    );
  }
}
