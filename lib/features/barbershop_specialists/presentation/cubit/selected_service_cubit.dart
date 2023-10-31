import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/service.dart';

part 'selected_service_state.dart';

class SelectedServiceCubit extends Cubit<SelectedServiceState> {
  SelectedServiceCubit() : super(NotSelected());
  select(ServiceModel service) {
    final currentState = super.state;
    if (currentState is Selected) {
      var services = [...currentState.services];
      if (services.any(
        (element) => element.id == service.id,
      )) {
        services.removeWhere(
          (element) => element.id == service.id,
        );
      } else {
        services.add(service);
      }
      emit(
        Selected(
          services: [...services],
        ),
      );
    } else {
      emit(
        Selected(
          services: [
            service,
          ],
        ),
      );
    }
  }
}
