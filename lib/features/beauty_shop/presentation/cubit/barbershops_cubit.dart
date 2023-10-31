import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/repositories/beauty_repo.dart';
import '../../../food_shop/data/models/place.dart';

part 'barbershops_state.dart';

class BarbershopsCubit extends Cubit<BarbershopsState> {
  BarbershopsCubit() : super(const BarbershopsState([]));
  load() async {
    final barbershops = await BeautyRepo().businessList();
    emit(
      BarbershopsState(
        barbershops,
      ),
    );
  }
}
