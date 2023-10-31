import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/beauty_order.dart';
import 'package:malina_mobile_app/features/my_orders/data/models/order.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/widgets/my_beauty_order_container.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/widgets/my_order_container.dart';

class MyOrdersList extends StatelessWidget {
  final List<MyOrderModel> orders;
  final List<MyBeautyOrderModel> beautyOrders;
  const MyOrdersList({
    Key? key,
    required this.orders,
    required this.beautyOrders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IdListType> idDate = orders
        .map(
          (e) => IdListType(
            id: e.id,
            date: e.date,
            order: e,
          ),
        )
        .toList();
    idDate.addAll(
      beautyOrders.map(
        (e) => IdListType(
          id: e.id,
          date: e.date,
          beautyOrder: e,
        ),
      ),
    );
    idDate.sort(
      (a, b) => a.date.compareTo(
        b.date,
      ),
    );
    return ListView.builder(
      itemBuilder: (context, index) {
        if (idDate[index].beautyOrder != null) {
          return MyBeautyOrderContainer(
            order: idDate[index].beautyOrder!,
          );
        }
        return MyOrderContainer(
          order: idDate[index].order!,
        );
      },
      itemCount: idDate.length,
    );
  }
}

class IdListType {
  final int id;
  final DateTime date;
  final MyOrderModel? order;
  final MyBeautyOrderModel? beautyOrder;
  IdListType({
    required this.id,
    required this.date,
    this.order,
    this.beautyOrder,
  });
}
