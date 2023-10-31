import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/profile/presentation/cubit/myinfo_controller.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/birthdate_sheet.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/email_sheet.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/first_last_name_sheet.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/password_sheet.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/phone_edit_sheet.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/phone_sheet.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';
import 'myinfo_main.dart';

class MyInfoBottomSheet extends StatelessWidget {
  const MyInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 750.h,
      child: BlocBuilder<MyInfoSheetContCubit, int>(
        builder: (context, state) {
          final List<Widget> pages = [
            const MyInfoMain(),
            FirstLastNameSheet(),
            PhoneNumberSheet(),
            BirtDateSheet(),
            EmailSheet(),
            PasswordSheet(),
            PhoneEditSheet(),
          ];
          return pages[state];
        },
      ),
    );
  }
}
