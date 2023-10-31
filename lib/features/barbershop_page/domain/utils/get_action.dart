import '../../data/enums/barbershop_action.dart';

String getBarbershopActionName(BarbershopActionEnum action) {
  switch (action) {

    case BarbershopActionEnum.services:
      return 'Услуги';
    case BarbershopActionEnum.specialists:
      return 'Специалисты';
    case BarbershopActionEnum.products:
      return 'Товары';
    case BarbershopActionEnum.sale:
      return 'Акции';
    case BarbershopActionEnum.info:
      return 'О заведении';
  }
}
String getBarbershopActionIcon(BarbershopActionEnum action) {
  switch (action) {
    case BarbershopActionEnum.services:
      return 'service';
    case BarbershopActionEnum.specialists:
      return 'specialist';
    case BarbershopActionEnum.products:
      return 'product';
    case BarbershopActionEnum.sale:
      return 'coupon';
    case BarbershopActionEnum.info:
      return 'info';
  }
}