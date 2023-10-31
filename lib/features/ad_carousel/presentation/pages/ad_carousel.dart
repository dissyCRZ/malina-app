import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class AdCarouselContainer extends StatelessWidget {
  const AdCarouselContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: [
          1,
          2,
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: borderR12,
                  color: AppColor.white,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/debug/ads/$i.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 200.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: borderR12,
                        color: AppColor.white.withOpacity(
                          0.5,
                        ),
                      ),
                      padding: marginH,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Кэшбэк',
                            style: h22,
                          ),
                          Text(
                            'с каждой покупки',
                            style: st18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
