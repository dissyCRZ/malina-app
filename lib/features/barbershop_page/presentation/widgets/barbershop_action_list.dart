import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/barbershop_page/data/enums/barbershop_action.dart';
import 'package:malina_mobile_app/features/barbershop_page/domain/utils/get_action.dart';
import 'package:malina_mobile_app/features/barbershop_page/presentation/widgets/barbershop_action_button.dart';
import '../cubit/barbershop_action_cubit.dart';

class BarbershopActionList extends StatefulWidget {
  const BarbershopActionList({
    super.key,
  });

  @override
  State<BarbershopActionList> createState() => _BarbershopActionListState();
}

class _BarbershopActionListState extends State<BarbershopActionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
      child: BlocBuilder<BarbershopActionCubit, BarbershopActionEnum>(
        builder: (context, state) {
          return ListView.separated(
            clipBehavior: Clip.none,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                context.read<BarbershopActionCubit>().change(
                      BarbershopActionEnum.values.elementAt(
                        index,
                      ),
                    );
                if (index == 1) {
                 
                }
              },
              child: BarbershopActionButton(
                title: getBarbershopActionName(
                  BarbershopActionEnum.values.elementAt(index),
                ),
                icon: getBarbershopActionIcon(
                  BarbershopActionEnum.values.elementAt(index),
                ),
                isSelected:
                    state == BarbershopActionEnum.values.elementAt(index),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: BarbershopActionEnum.values.length,
            scrollDirection: Axis.horizontal,
          );
        },
      ),
    );
  }
}
