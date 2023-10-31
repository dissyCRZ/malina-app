part of 'ingredients_cubit.dart';

class IngredientsState extends Equatable {
  final List<FoodExtraEnum> extras;
  const IngredientsState(
    this.extras,
  );

  @override
  List<Object> get props => [extras];
}
