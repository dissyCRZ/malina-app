import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:malina_mobile_app/features/profile/data/models/visit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class LastVisitContainer extends StatelessWidget {
  final VisitModel visit;
  const LastVisitContainer({
    Key? key,
    required this.visit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: borderR15,
        border: Border.all(
          color: AppColor.grey,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 65,
            width: 65,
            child: Image.asset(
              'assets/images/profile/${visit.image}.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                visit.restaurant,
                style: h12,
              ),
              Text(
                'Номер чека ${visit.check}',
                style: st12,
              ),
              Text(
                'Сумма ${visit.price}',
                style: st12,
              ),
              Text(
                'Дата ${DateFormat('dd.mm.yyyy').format(visit.date)}',
                style: st12,
              ),
            ],
          )
        ],
      ),
    );
  }
}
