import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';

class BarbershopSpecialistContCubit extends Cubit<SpecialistModel> {
  BarbershopSpecialistContCubit(SpecialistModel specialist) : super(specialist);
  change(SpecialistModel specialist) {
    emit(specialist);
  }
}
