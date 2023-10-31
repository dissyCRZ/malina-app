import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/barbershop_category.dart';
import 'package:malina_mobile_app/features/food_shop/presentation/cubit/selected_restaurant_category.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'restaurant_type_container.dart';

class RestaurantTypes extends StatelessWidget {
  final List<BusinessCategoryModel> tags;
  const RestaurantTypes({
    Key? key,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: marginH,
      margin: const EdgeInsets.only(
        bottom: 5,
      ),
      child: BlocBuilder<SelectedRestaurantCategory, BusinessCategoryModel>(
        builder: (context, state) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                context.read<SelectedRestaurantCategory>().select(
                      tags[index],
                    );
              },
              child: RestaurantTypeContainer(
                tag: tags[index],
                isSelected: state.id == tags[index].id,
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: tags.length,
          );
        },
      ),
    );
  }
}
