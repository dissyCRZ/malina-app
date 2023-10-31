import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/records/presentation/cubit/records_cubit.dart';
import 'package:malina_mobile_app/features/records/presentation/pages/records_sheet.dart';

Future<dynamic> recordsBottomSheet(
  BuildContext buildContext,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) =>  BlocProvider.value(
      value: BlocProvider.of<RecordsCubit>(buildContext),
      child: const RecordsSheet(),
    ),
    isScrollControlled: true,
  );
}
