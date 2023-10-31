import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/address/data/models/address.dart';

part 'address_cont_state.dart';

class AddressContCubit extends Cubit<AddressContState> {
  AddressContCubit()
      : super(
          AddressNotSelected(),
        );
  select(AddressModel address) {
    log('address  selected');
    emit(
      AddressSelected(
        address: address,
      ),
    );
  }
}
