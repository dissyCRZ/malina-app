part of 'address_cubit.dart';

class AddressState extends Equatable {
  final List<AddressModel> addresses;
  const AddressState(
    this.addresses,
  );

  @override
  List<Object> get props => [addresses];
}
