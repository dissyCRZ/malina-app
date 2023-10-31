import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/login/data/models/user.dart';
import 'package:malina_mobile_app/features/notification/domain/utils/notification_sheet.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/profile_navigation_buttons.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class ProfileData extends StatelessWidget {
  final UserModel user;
  const ProfileData({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: marginH,
      decoration: BoxDecoration(
        borderRadius: borderR20,
        color: AppColor.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: marginHV20,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColor.lightGrey,
                  child: Text(
                    user.userName?.characters.first ?? 'П',
                    style: h18,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.userName ?? 'Пользователь',
                        style: h18,
                      ),
                      Text(
                        user.phoneNumber,
                        style: st14,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    notificationBottomSheet(
                      context,
                    );
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.malina,
                    child: Image.asset(
                      'assets/icons/profile/notification.png',
                      color: AppColor.white,
                      width: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: AppColor.grey,
          ),
          const Padding(
            padding: marginHV20,
            child: ProfileNavigationButtons(),
          ),
        ],
      ),
    );
  }
}
