import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/restaurant_page/data/enums/restaurant_action.dart';

class RestaurantActionCubit extends Cubit<RestaurantActionEnum> {
  RestaurantActionCubit()
      : super(
          RestaurantActionEnum.menu,
        );
  change(RestaurantActionEnum action) {
    emit(
      action,
    );
  }
}
