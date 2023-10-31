import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/abstract_order.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/get_order_status_color.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/get_order_status_name.dart';
import 'package:malina_mobile_app/features/my_orders/domain/utils/get_order_type_name.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/widgets/info_row_item.dart';
import 'package:malina_mobile_app/shared/utils/date_time_extension.dart';
import 'package:malina_mobile_app/shared/utils/get_last_numbers.dart';

class MyOrderInfoGeneral extends StatelessWidget {
  final AbstractOrderModel order;
  const MyOrderInfoGeneral({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyOrderInfoRowItem(
          title: 'Номер заказа',
          value: '#${getLastNumber(
            order.id.toString(),
            6,
          )}',
        ),
        MyOrderInfoRowItem(
          title: 'Статус заказа',
          value: getOrderStatusName(
            order.status,
          ),
          color: getOrderStatusColor(
            order.status,
          ),
        ),
        MyOrderInfoRowItem(
          title: 'Вид заказа',
          value: getOrderTypeName(
            order.type,
          ),
        ),
        const MyOrderInfoRowItem(
          title: 'Оплата',
          value: 'Наличными',
        ),
        MyOrderInfoRowItem(
          title: 'Дата и время заказа',
          value: order.date.timedayMonthYear(context),
        ),
      ],
    );
  }
}
