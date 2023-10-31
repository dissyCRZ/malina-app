import 'package:malina_mobile_app/features/restaurant_page/data/enums/restaurant_action.dart';

String getActionName(RestaurantActionEnum action) {
  switch (action) {
    case RestaurantActionEnum.menu:
      return 'Меню';
    case RestaurantActionEnum.booking:
      return 'Бронировать';
    case RestaurantActionEnum.sale:
      return 'Акции';
    case RestaurantActionEnum.info:
      return 'О заведении';
  }
}

String getActionIcon(RestaurantActionEnum action) {
  switch (action) {
    case RestaurantActionEnum.menu:
      return 'menu';
    case RestaurantActionEnum.booking:
      return 'calendar-tick';
    case RestaurantActionEnum.sale:
      return 'coupon';
    case RestaurantActionEnum.info:
      return 'info';
  }
}
