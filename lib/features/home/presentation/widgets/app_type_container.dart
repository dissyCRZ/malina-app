import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class AppTypeContainer extends StatelessWidget {
  final String title;
  final String image;
  final String desc;
  final Color? color;
  final Function? function;
  const AppTypeContainer({
    Key? key,
    required this.title,
    required this.image,
    required this.desc,
    this.color,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function!();
        }
      },
      child: Container(
        height: 170,
        width: double.infinity,
        margin: marginHV10,
        decoration: BoxDecoration(
          borderRadius: borderR12,
          color: color,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/main/$image.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 120.w,
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: h22,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    desc,
                    style: st16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
