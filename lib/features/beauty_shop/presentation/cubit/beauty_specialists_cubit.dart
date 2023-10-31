import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_specialists/data/models/specialist.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/repositories/beauty_repo.dart';

class BeautySpecialistsCubit extends Cubit<List<SpecialistModel>> {
  BeautySpecialistsCubit()
      : super(
          [],
        );
  load() async {
    final beautyServices = await BeautyRepo().specialistsList();
    emit(
      beautyServices,
    );
  }

  List<SpecialistModel> getServiceBySupplier(int id) {
    return state
        .where(
          (element) => element.businessId == id,
        )
        .toList();
  }
}
