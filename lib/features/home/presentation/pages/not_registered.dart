import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/home/data/enums/app_type.dart';
import 'package:malina_mobile_app/features/home/presentation/cubit/app_type_cubit.dart';
import 'package:malina_mobile_app/features/home/presentation/widgets/app_type_container.dart';
import 'package:malina_mobile_app/features/home/presentation/widgets/home_search.dart';
import 'package:malina_mobile_app/features/home/presentation/widgets/scan_container.dart';
import 'package:malina_mobile_app/features/home/presentation/widgets/upcoming_malina.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';

class NotRegisteredShop extends StatelessWidget {
  const NotRegisteredShop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: appbarPadding,
            child: HomeSearchBar(
              isEnabled: false,
            ),
          ),
          const ScanContainer(),
          AppTypeContainer(
            title: 'Еда',
            image: 'food',
            desc: 'Из кафе и ресторанов',
            function: () {
              context.read<AppTypeCubit>().change(
                    AppType.food,
                  );
            },
          ),
          AppTypeContainer(
            title: 'Бьюти',
            image: 'beauty',
            color: AppColor.lightRed,
            desc: 'Салоны красоты и товары',
            function: () {
              context.read<AppTypeCubit>().change(
                    AppType.beauty,
                  );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const UpcomingMalina(),
        ],
      ),
    );
  }
}
