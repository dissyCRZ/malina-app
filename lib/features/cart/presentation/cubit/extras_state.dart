part of 'extras_cubit.dart';

class OrderExtrasState extends Equatable {
  final List<FoodExtraEnum> extras;
  const OrderExtrasState(
    this.extras,
  );

  @override
  List<Object> get props => [extras];
}
