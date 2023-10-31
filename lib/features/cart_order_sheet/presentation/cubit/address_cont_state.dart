part of 'address_cont_cubit.dart';

abstract class AddressContState extends Equatable {
  const AddressContState();

  @override
  List<Object> get props => [];
}

class AddressNotSelected extends AddressContState {}

class AddressSelected extends AddressContState {
  final AddressModel address;
  const AddressSelected({
    required this.address,
  });
  @override
  List<Object> get props => [
        address,
      ];
}
