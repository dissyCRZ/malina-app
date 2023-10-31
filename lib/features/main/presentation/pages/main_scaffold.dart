import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:malina_mobile_app/features/cart/presentation/pages/cart.dart';
import 'package:malina_mobile_app/features/favourites/presentation/pages/favourites.dart';
import 'package:malina_mobile_app/features/home/presentation/pages/home.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/cart_button_controller.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/cart_type_cubit.dart';
import 'package:malina_mobile_app/features/main/presentation/cubit/page_controller_cubit.dart';
import 'package:malina_mobile_app/features/main/presentation/widgets/bottom_navbar.dart';
import 'package:malina_mobile_app/features/profile/presentation/pages/profile.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const Center(
        child: Text('Лента'),
      ),
      const FavouritesPage(),
      const HomePage(),
      const ProfilePage(),
      const CartPage(),
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageContCubit(),
        ),
        BlocProvider(
          create: (context) => CartButtonContCubit(),
        ),
        BlocProvider(
          create: (context) => CartTypeCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return KeyboardDismisser(
          child: BlocBuilder<PageContCubit, int>(
            builder: (context, state) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                extendBody: true,
                backgroundColor:
                    state == 3 ? AppColor.malina : AppColor.scaffold,
                body: pages[state],
                bottomNavigationBar: const CustomBottomNavbar(),
              );
            },
          ),
        );
      }),
    );
  }
}
