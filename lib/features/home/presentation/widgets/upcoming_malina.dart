import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/home/data/datasources/upcoming.dart';
import 'package:malina_mobile_app/features/home/presentation/widgets/upcoming_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';

class UpcomingMalina extends StatelessWidget {
  const UpcomingMalina({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Скоро в Malina',
            style: h16,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 85,
            child: ListView.separated(
              itemBuilder: (context, index) => UpcomingContainer(
                title: upcomingTitleList[index],
                color: upcomingColorList[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: upcomingTitleList.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
