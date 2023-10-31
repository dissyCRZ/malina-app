import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/filter_sheet/presentation/cubit/filter_sheet_cubit.dart';
import '../../presentation/pages/filter_sheet.dart';

Future<dynamic> filterBottomSheet(
  BuildContext buildContext,
  List<String> titles,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => BlocProvider.value(
      value: BlocProvider.of<FilterSheetCubit>(buildContext),
      child: FilterSheet(
        titles: titles,
      ),
    ),
    isScrollControlled: true,
  );
}
