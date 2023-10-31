part of 'favourites_cubit.dart';

abstract class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object> get props => [];
}

class FavouritesEmpty extends FavouritesState {}

class FavouritesLoaded extends FavouritesState {
  final List<FoodModel> foods;
  final List<FavouriteProductModel> products;
  final List<BusinessModel> restaurants;
  const FavouritesLoaded({
    required this.foods,
    required this.products,
    required this.restaurants,
  });

  @override
  List<Object> get props => [
        foods,
        restaurants,
        products,
      ];
}
