import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/restaurant_page/data/enums/affordability.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class AffordabilityContainer extends StatelessWidget {
  final Affordability affordability;
  const AffordabilityContainer({
    Key? key,
    required this.affordability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cheapness = getAffordability(affordability);
    return Row(
      children: List.generate(
        3,
        (index) => Container(
          height: 12,
          margin: const EdgeInsets.all(1),
          child: Image.asset(
            'assets/icons/currency.png',
            color: 3 - index > cheapness ? AppColor.black : AppColor.grey,
          ),
        ),
      ),
    );
  }
}

int getAffordability(Affordability affordability) {
  switch (affordability) {
    case Affordability.low:
      return 2;
    case Affordability.mid:
      return 1;
    case Affordability.high:
      return 0;
  }
}
