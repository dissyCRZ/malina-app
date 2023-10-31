import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';

String getOrderTypeName(DeliveryTypeEnum type) {
  switch (type) {
    case DeliveryTypeEnum.delivery:
      return 'На доставку';
    case DeliveryTypeEnum.outside:
      return 'На заведении';
  }
}
