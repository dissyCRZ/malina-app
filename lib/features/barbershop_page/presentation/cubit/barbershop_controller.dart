import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../food_shop/data/models/place.dart';

class BarbershopContCubit extends Cubit<BusinessModel> {
  BarbershopContCubit(BusinessModel barbershop) : super(barbershop);
  change(BusinessModel barbershop) {
    emit(
      barbershop,
    );
  }
}
