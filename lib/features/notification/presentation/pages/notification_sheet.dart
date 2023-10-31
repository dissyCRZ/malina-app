import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/filter_sheet/domain/utils/filter_sheet.dart';
import 'package:malina_mobile_app/features/filter_sheet/presentation/cubit/filter_sheet_cubit.dart';
import 'package:malina_mobile_app/features/notification/data/enums/notification_type.dart';
import 'package:malina_mobile_app/features/notification/domain/utils/get_notification_type_title.dart';
import 'package:malina_mobile_app/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:malina_mobile_app/features/notification/presentation/widgets/notifications_list.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'package:malina_mobile_app/shared/widgets/sheet_filter_button.dart';

class NotificationSheet extends StatelessWidget {
  const NotificationSheet({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotificationCubit()..load(),
        ),
        BlocProvider(
          create: (context) => FilterSheetCubit(),
        ),
      ],
      child: BottomSheetContainer(
        height: 750.h,
        hasPadding: false,
        child: Column(
          children: [
            Padding(
              padding: marginHV20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Уведомления',
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
            Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    filterBottomSheet(
                      context,
                      NotificationTypeEnum.values
                          .map(
                            (e) => getNotificationTypeTitle(e),
                          )
                          .toList(),
                    );
                  },
                  child: const SheetFilterButton(),
                );
              },
            ),
            Builder(builder: (context) {
              return BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  return NotificationsList(
                    allNotifications: state.notifications,
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
