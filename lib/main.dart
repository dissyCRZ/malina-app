import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/address_cubit.dart';
import 'package:malina_mobile_app/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/beauty_cart_cubit.dart';
import 'package:malina_mobile_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:malina_mobile_app/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:malina_mobile_app/features/home/presentation/cubit/app_type_cubit.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/features/my_orders/presentation/cubit/my_orders_cubit.dart';
import 'package:malina_mobile_app/features/records/presentation/cubit/records_cubit.dart';
import 'shared/configs/routes.dart';
import 'shared/configs/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('user');
  await Hive.openBox('appType');
  runApp(
    BlocProvider(
      create: (context) => LoginCubit()..init(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppTypeCubit(),
        ),
        BlocProvider(
          create: (context) => FavouritesCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => BeautyCartCubit(),
        ),
        BlocProvider(
          create: (context) => MyOrdersCubit(),
        ),
        BlocProvider(
          create: (context) => AddressCubit(),
        ),
        BlocProvider(
          create: (context) => BookingCubit(),
        ),
        BlocProvider(
          create: (context) => RecordsCubit(),
        ),
      ],
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoggedIn) {
            context.read<FavouritesCubit>().load();
            context.read<CartCubit>().load();
            context.read<BeautyCartCubit>().load();
            context.read<MyOrdersCubit>().load();
            context.read<BookingCubit>().load();
            context.read<AddressCubit>().load();
            context.read<RecordsCubit>().load();
          } else if (state is LoggedOut) {
            context.read<FavouritesCubit>().empty();
            context.read<CartCubit>().empty();
            context.read<BeautyCartCubit>().empty();
            context.read<MyOrdersCubit>().empty();
            context.read<BookingCubit>().empty();
            context.read<AddressCubit>().empty();
            context.read<RecordsCubit>().empty();
          }
        },
        child: const MyAppBlocInit(),
      ),
    );
  }
}

class MyAppBlocInit extends StatelessWidget {
  const MyAppBlocInit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.read<LoginCubit>().state is LoggedIn) {
      context.read<FavouritesCubit>().load();
      context.read<CartCubit>().load();
      context.read<BeautyCartCubit>().load();
      context.read<MyOrdersCubit>().load();
      context.read<BookingCubit>().load();
      context.read<AddressCubit>().load();
      context.read<RecordsCubit>().load();
    }
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Malina App',
        theme: mainTheme,
        routerConfig: router,
      ),
    );
  }
}
