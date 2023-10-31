import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/shared/widgets/sheet_filter_button.dart';
import '../widgets/my_orders_list.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/cubit/my_orders_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';

class MyOrdersSheet extends StatelessWidget {
  const MyOrdersSheet({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      height: 750.h,
      hasPadding: false,
      child: Column(
        children: [
          Padding(
            padding: marginHV20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Мои заказы',
                  style: h20,
                ),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: const Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: marginH,
                    width: double.infinity,
                    child: ButtonsTabBar(
                      center: false,
                      backgroundColor: AppColor.malina,
                      unselectedBorderColor: AppColor.grey,
                      borderColor: AppColor.malina,
                      borderWidth: 1,
                      unselectedBackgroundColor: AppColor.scaffold,
                      labelStyle: st16.copyWith(color: AppColor.white),
                      unselectedLabelStyle: st16,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      radius: 100,
                      height: 45,
                      tabs: const [
                        Tab(
                          text: 'Доставка',
                        ),
                        Tab(
                          text: 'В заведении',
                        ),
                      ],
                    ),
                  ),
                  const SheetFilterButton(),
                  Expanded(
                    child: BlocBuilder<MyOrdersCubit, MyOrdersState>(
                      builder: (context, state) {
                        return TabBarView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            MyOrdersList(
                              orders: state.orders
                                  .where(
                                    (element) =>
                                        element.type ==
                                        DeliveryTypeEnum.delivery,
                                  )
                                  .toList(),
                              beautyOrders: state.beautyOrders
                                  .where(
                                    (element) =>
                                        element.type ==
                                        DeliveryTypeEnum.delivery,
                                  )
                                  .toList(),
                            ),
                            MyOrdersList(
                              orders: state.orders
                                  .where(
                                    (element) =>
                                        element.type ==
                                        DeliveryTypeEnum.outside,
                                  )
                                  .toList(),
                              beautyOrders: state.beautyOrders
                                  .where(
                                    (element) =>
                                        element.type ==
                                        DeliveryTypeEnum.outside,
                                  )
                                  .toList(),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
