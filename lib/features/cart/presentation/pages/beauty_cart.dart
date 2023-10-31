import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/beauty_cart_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import '../../../main/presentation/cubit/page_controller_cubit.dart';
import '../widgets/beauty_order_container.dart';

class BeautyCartPage extends StatelessWidget {
  const BeautyCartPage({super.key});

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
              const Text(
                'Очистить',
                style: st14,
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<BeautyCartCubit, BeautyCartState>(
            builder: (context, state) {
              return ListView.builder(
                itemBuilder: (context, index) => BeautyOrderContainer(
                  order: state.beautyOrders[index],
                ),
                itemCount: state.beautyOrders.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
