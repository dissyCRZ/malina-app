import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_specialty.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/repositories/beauty_repo.dart';

class BeautySpecialistCategoryCubit extends Cubit<List<BeautySpecialtyModel>> {
  BeautySpecialistCategoryCubit() : super([]);
  load() async {
    final categories = await BeautyRepo().specialtyList();
    emit(
      categories,
    );
  }
}
