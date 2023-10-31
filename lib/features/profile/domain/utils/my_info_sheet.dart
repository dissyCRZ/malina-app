import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/profile/presentation/cubit/myinfo_controller.dart';
import 'package:malina_mobile_app/features/profile/presentation/widgets/myinfo_bottom_sheet.dart';

Future<dynamic> myInfoModalSheet(BuildContext buildContext) {
  return showModalBottomSheet(
    context: buildContext,
    isScrollControlled: true,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: BlocProvider.of<LoginCubit>(buildContext),
        ),
        BlocProvider(
          create: (context) => MyInfoSheetContCubit(),
        ),
      ],
      child: const MyInfoBottomSheet(),
    ),
  );
}
