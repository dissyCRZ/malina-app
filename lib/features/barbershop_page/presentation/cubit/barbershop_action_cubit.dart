import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/enums/barbershop_action.dart';

class BarbershopActionCubit extends Cubit<BarbershopActionEnum> {
  BarbershopActionCubit()
      : super(
          BarbershopActionEnum.services,
        );
  change(BarbershopActionEnum action) {
    emit(
      action,
    );
  }
}
