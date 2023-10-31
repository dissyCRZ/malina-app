import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/data/models/address.dart';
import 'package:malina_mobile_app/features/address/data/repositories/address_repo.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(const AddressState([]));
  load() async {
    final addresses = await AddressRepo().addressList();
    emit(
      AddressState(
        addresses,
      ),
    );
  }

  empty() {
    emit(
      const AddressState(
        [],
      ),
    );
  }

  addAddress(AddressModel address) {
    AddressRepo().addressCreate(
      address,
    );
    emit(
      AddressState(
        [
          ...super.state.addresses,
          address,
        ],
      ),
    );
  }

  editAddress(AddressModel address) {
    AddressRepo().addressUpdate(
      address,
    );
    List<AddressModel> addresses = [...super.state.addresses];
    final index = addresses.indexWhere(
      (element) => element.id == address.id,
    );
    addresses.removeAt(index);
    addresses.insert(index, address);
    emit(
      AddressState(
        addresses,
      ),
    );
  }

  deleteAddress(String id) async {
    AddressRepo().addressDelete(
      id,
    );
    List<AddressModel> addresses = [...super.state.addresses];
    addresses.removeWhere(
      (element) => element.id == id,
    );
    emit(
      AddressState(
        addresses,
      ),
    );
  }
}
