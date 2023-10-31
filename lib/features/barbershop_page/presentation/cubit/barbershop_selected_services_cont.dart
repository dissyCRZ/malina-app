import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../barbershop_specialists/data/models/service.dart';

class BarbershopSelectedServicesContCubit extends Cubit<List<ServiceModel>> {
  BarbershopSelectedServicesContCubit() : super([]);
  bool isSelected(ServiceModel service) {
    return super.state.any(
          (element) => element.id == service.id,
        );
  }

  select(ServiceModel service) {
    List<ServiceModel> services = [...super.state];
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
      services,
    );
  }
}
