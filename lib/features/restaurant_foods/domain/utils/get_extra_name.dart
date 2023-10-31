import 'package:malina_mobile_app/features/restaurant_foods/data/enums/food_extra.dart';

String getExtraName(FoodExtraEnum extra) {
  switch (extra) {
    case FoodExtraEnum.noExtra:
      return 'Без добавок';
    case FoodExtraEnum.cheese:
      return 'Сыр';
    case FoodExtraEnum.sause:
      return 'Соус';
    case FoodExtraEnum.olive:
      return 'Оливки';
    case FoodExtraEnum.sausage:
      return 'Сосиски';
  }
}

String getExtraPrice(FoodExtraEnum extra) {
  switch (extra) {
    case FoodExtraEnum.noExtra:
      return '';
    case FoodExtraEnum.cheese:
      return '35 C';
    case FoodExtraEnum.sause:
      return '15 C';
    case FoodExtraEnum.olive:
      return '20 C';
    case FoodExtraEnum.sausage:
      return '25 C';
  }
}
