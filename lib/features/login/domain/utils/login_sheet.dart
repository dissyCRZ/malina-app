import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/login/presentation/pages/login_sheet.dart';

Future<dynamic> loginBottomSheet(
  BuildContext buildContext,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => BlocProvider<LoginCubit>.value(
      value: BlocProvider.of<LoginCubit>(context),
      child:  const LoginSheet(),
    ),
    isScrollControlled: true,
  );
}
