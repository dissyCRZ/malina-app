part of 'restaurant_cubit.dart';

class RestaurantState extends Equatable {
  final List<BusinessModel> restaurants;
  const RestaurantState(
    this.restaurants,
  );

  @override
  List<Object> get props => [restaurants];
}
