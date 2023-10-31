import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/restaurant_info/domain/repositories/comments.dart';
import 'package:malina_mobile_app/features/restaurant_info/domain/utils/add_extras.dart';
import 'package:malina_mobile_app/features/restaurant_info/presentation/widgets/comment_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class BarbershopSpecialistSheetInfo extends StatelessWidget {
  const BarbershopSpecialistSheetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: marginHV10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hair — Элитный салон красоты',
            style: h18,
          ),
          const Text(
            'Мужские и женские стрижки, маникюр, педикюр, коррекция бровей. Работают профессиональные мастера, которым вы можете довериться.',
            style: st14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Отзывы',
                style: h18,
              ),
              GestureDetector(
                onTap: () {
                  restaurantCommentsBottomSheet(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Смотреть все',
                    style: st14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 180,
            child: FutureBuilder(
              future: CommentsRepository().getComments(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PageView.builder(
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) => CommentContainer(
                      comment: snapshot.data![index],
                    ),
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.horizontal,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
