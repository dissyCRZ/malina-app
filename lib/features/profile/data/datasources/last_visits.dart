import 'dart:math';
import 'package:malina_mobile_app/features/profile/data/models/visit.dart';

List<VisitModel> lastVisitsList = [
  VisitModel(
    restaurant: 'Империя пиццы',
    check: 4213432,
    price: 324,
    date: DateTime.now().subtract(
      Duration(
        days: Random().nextInt(20),
      ),
    ),
    image: 'bublik',
  ),
  VisitModel(
    restaurant: 'Кофейня Бублик',
    check: 2349218,
    price: 241,
    date: DateTime.now().subtract(
      Duration(
        days: Random().nextInt(20),
      ),
    ),
    image: 'imperia',
  ),
];
