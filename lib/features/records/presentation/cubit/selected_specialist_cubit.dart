import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';

part 'selected_specialist_state.dart';

class SelectedSpecialistCubit extends Cubit<SelectedSpecialistState> {
  SelectedSpecialistCubit() : super(NotSelected());
  select(SpecialistModel specialist) {
    emit(
      Selected(
        specialist: specialist,
      ),
    );
  }
}
