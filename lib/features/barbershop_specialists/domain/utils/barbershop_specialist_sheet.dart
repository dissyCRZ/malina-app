import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/cubit/barbershop_controller.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/presentation/pages/barbershop_specialist_sheet.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_services_cubit.dart';
import 'package:malina_mobile_app/features/records/presentation/cubit/records_cubit.dart';

Future<dynamic> barbershopSpecialistBottomSheet(
  BuildContext buildContext,
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
          value: BlocProvider.of<BarbershopContCubit>(buildContext),
        ),
        BlocProvider.value(
          value: BlocProvider.of<BeautyServicesCubit>(buildContext),
        ),
      ],
      child: BarbershopSpecialistSheet(
        specialist: specialist,
      ),
    ),
    isScrollControlled: true,
  );
}
