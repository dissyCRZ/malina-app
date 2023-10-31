import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_services_cubit.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_specialists_cubit.dart';
import 'package:malina_mobile_app/features/records/presentation/cubit/records_cubit.dart';
import 'package:malina_mobile_app/features/records/presentation/pages/add_record_comment_sheet.dart';
import '../../../food_shop/data/models/place.dart';

Future<dynamic> addRecordCommentBottomSheet(
  BuildContext buildContext,
  BusinessModel barbershop,
  SpecialistModel specialist,
  DateTime time,
  List<int> services,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: BlocProvider.of<RecordsCubit>(buildContext),
        ),
        BlocProvider.value(
          value: BlocProvider.of<BeautyServicesCubit>(buildContext),
        ),
        BlocProvider.value(
          value: BlocProvider.of<BeautySpecialistsCubit>(buildContext),
        ),
      ],
      child: AddRecordCommentSheet(
        specialist: specialist,
        barbershop: barbershop,
        services: services,
        time: time,
      ),
    ),
    isScrollControlled: true,
  );
}
