import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/cart/presentation/pages/beauty_cart.dart';
import 'package:malina_mobile_app/features/cart/presentation/pages/food_cart.dart';
import 'package:malina_mobile_app/features/cart/presentation/pages/notsigned_cart.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/main/data/enums/cart_type.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/cart_type_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoggedIn) {
          return const CartTypeBuilder();
        }
        return const NotSignedCartPage();
      },
    );
  }
}

class CartTypeBuilder extends StatelessWidget {
  const CartTypeBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartTypeCubit, CartTypeEnum>(
      builder: (context, state) {
        switch (state) {
          case CartTypeEnum.food:
            return const FoodCartPage();
          case CartTypeEnum.beauty:
            return const BeautyCartPage();
        }
      },
    );
  }
}
