import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_page_cubit.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/phone_number_cubit.dart';
import 'package:malina_mobile_app/features/login/presentation/widgets/code_page.dart';
import 'package:malina_mobile_app/features/login/presentation/widgets/phone_page.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';

class LoginSheet extends StatefulWidget {
  const LoginSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final pages = [
      LoginPhonePage(),
      const LoginCodePage(),
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginPageCubit(),
        ),
        BlocProvider(
          create: (context) => PhoneNumberCubit(),
        ),
      ],
      child: BottomSheetContainer(
        height: 750.h,
        child: BlocBuilder<LoginPageCubit, int>(
          builder: (context, state) {
            return pages[state];
          },
        ),
      ),
    );
  }
}
