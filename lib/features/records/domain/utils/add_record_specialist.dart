import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/records/presentation/cubit/records_cubit.dart';
import 'package:malina_mobile_app/features/records/presentation/pages/add_record_specialist_sheet.dart';
import '../../../beauty_shop/presentation/cubit/beauty_services_cubit.dart';
import '../../../beauty_shop/presentation/cubit/beauty_specialists_cubit.dart';
import '../../../food_shop/data/models/place.dart';

Future<dynamic> addRecordSpecialistBottomSheet(
  BuildContext buildContext,
  BusinessModel barbershop,
  SpecialistModel specialist,
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
      child: AddRecordSpecialistSheet(
        specialist: specialist,
        barbershop: barbershop,
      ),
    ),
    isScrollControlled: true,
  );
}
