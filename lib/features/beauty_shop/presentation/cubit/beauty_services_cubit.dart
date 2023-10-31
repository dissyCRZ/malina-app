import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/service.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/repositories/beauty_repo.dart';

class BeautyServicesCubit extends Cubit<List<ServiceModel>> {
  BeautyServicesCubit()
      : super(
          [],
        );
  load() async {
    final beautyServices = await BeautyRepo().servicesList();
    emit(
      beautyServices,
    );
  }

  ServiceModel? getById(int id) {
    try {
      return state.firstWhere(
        (element) => element.businessId == id,
      );
    } catch (e) {
      return null;
    }
  }

  List<ServiceModel> getServiceBySupplier(int id) {
    return state
        .where(
          (element) => element.businessId == id,
        )
        .toList();
  }
}
