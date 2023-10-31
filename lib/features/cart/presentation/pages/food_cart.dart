import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/cart/data/enums/order_type.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:malina_mobile_app/features/cart/presentation/widgets/cart_list_container.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/page_controller_cubit.dart';
import 'package:malina_mobile_app/features/popups/domain/utils/popup_sheet.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class FoodCartPage extends StatelessWidget {
  const FoodCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: appbarPadding,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<PageContCubit>().change(2);
                },
                child: const Icon(
                  Icons.keyboard_arrow_left,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: Text(
                  'Корзина',
                  style: h20,
                ),
              ),
              GestureDetector(
                onTap: () {
                  popupBottomSheet(
                    context,
                    'Вы хотите очистить корзину?',
                    'При очищении всей корзины удаляться все записи находящиеся в корзине',
                    'Очистить',
                    'Отмена',
                    () {
                      context.read<CartCubit>().empty();
                    },
                    () {
                      context.pop();
                    },
                  );
                },
                child: const Text(
                  'Очистить',
                  style: st14,
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
                        text: 'В заведении',
                      ),
                      Tab(
                        text: 'Доставка',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          FoodCartListContainer(
                            orders: state.foodOrders
                                .where(
                                  (element) =>
                                      element.type == DeliveryTypeEnum.outside,
                                )
                                .toList(),
                          ),
                          FoodCartListContainer(
                            orders: state.foodOrders
                                .where(
                                  (element) =>
                                      element.type == DeliveryTypeEnum.delivery,
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
    );
  }
}
