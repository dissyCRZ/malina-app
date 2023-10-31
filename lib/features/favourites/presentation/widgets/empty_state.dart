import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/login/domain/utils/login_sheet.dart';
import 'package:malina_mobile_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/border_radius.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/malina_filled_button.dart';
import 'package:malina_mobile_app/shared/widgets/rounded_shadow_container.dart';
import 'package:malina_mobile_app/shared/widgets/search_bar.dart';

class FavouritesEmptyState extends StatelessWidget {
  const FavouritesEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      margin: marginH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: borderR12,
            child: SizedBox(
              width: 95,
              height: 95,
              child: Image.asset(
                'assets/images/emoji/empty.png',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'В избранном пусто',
            style: h24,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Войдите чтобы посмотреть свой список избранных товаров, блюд и заведений',
            style: st14,
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              if (state is Initial) {
                return MalinaFilledButton(
                  title: 'Войти',
                  height: 60,
                  function: () {
                    loginBottomSheet(context);
                  },
                );
              }
              return const SimpleSearchBar();
            },
          ),
        ],
      ),
    );
  }
}
