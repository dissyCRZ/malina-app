import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedServicesContCubit extends Cubit<List<int>> {
  SelectedServicesContCubit() : super([]);
  bool isSelected(int serviceId) {
    return super.state.any(
          (element) => element == serviceId,
        );
  }

  select(int serviceId) {
    List<int> services = [...super.state];
    if (services.any(
      (element) => element == serviceId,
    )) {
      services.removeWhere(
        (element) => element == serviceId,
      );
    } else {
      services.add(serviceId);
    }
    emit(
      services,
    );
  }
}
