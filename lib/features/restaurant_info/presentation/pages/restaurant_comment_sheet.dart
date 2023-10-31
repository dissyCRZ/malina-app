import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/restaurant_info/domain/repositories/comments.dart';
import 'package:malina_mobile_app/features/restaurant_info/presentation/widgets/comment_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import '../widgets/comments_summary.dart';

class RestaurantCommentsSheet extends StatelessWidget {
  const RestaurantCommentsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      hasPadding: false,
      height: 750.h,
      child: Column(
        children: [
          Padding(
            padding: marginHV20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Добавить адрес',
                  style: h20,
                ),
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
          const Padding(
            padding: marginHV10,
            child: CommentsSummary(),
          ),
          const Padding(
            padding: marginH,
            child: MalinaFilledButton(
              title: 'Оставить отзыв',
              color: AppColor.lightGrey,
              height: 60,
              textColor: AppColor.black,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: CommentsRepository().getComments(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) => CommentContainer(
                      margin: marginHV5,
                      comment: snapshot.data![index],
                    ),
                    itemCount: snapshot.data!.length,
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
