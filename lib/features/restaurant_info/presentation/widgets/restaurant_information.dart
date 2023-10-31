import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/food_shop/data/models/place.dart';
import 'package:malina_mobile_app/features/restaurant_info/domain/repositories/comments.dart';
import 'package:malina_mobile_app/features/restaurant_info/domain/utils/add_extras.dart';
import 'package:malina_mobile_app/features/restaurant_info/presentation/widgets/comment_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';

class PlaceInformation extends StatelessWidget {
  final BusinessModel place;
  const PlaceInformation({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place.slogan ?? place.name,
              style: h18,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              place.description,
              style: it14,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Режим работы',
              style: h18,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              place.workTime ?? '',
              style: it14,
            ),
          ],
        ),
        const SizedBox(
          height: 25,
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
        const MalinaFilledButton(
          title: 'Пожаловаться на заведение',
          color: AppColor.lightGrey,
          height: 60,
          textColor: AppColor.grey,
        ),
      ],
    );
  }
}
