part of 'selected_address_cubit.dart';

abstract class SelectedAddressState extends Equatable {
  const SelectedAddressState();

  @override
  List<Object> get props => [];
}

class NotSelected extends SelectedAddressState {}

class Selected extends SelectedAddressState {
  final SearchResultModel location;
  const Selected({
    required this.location,
  });
  
  @override
  List<Object> get props => [location];
}
