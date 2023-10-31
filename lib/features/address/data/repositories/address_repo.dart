import 'dart:convert';
import 'dart:developer';
import 'package:malina_mobile_app/features/address/data/models/address.dart';
import 'package:malina_mobile_app/shared/classes/base_http_client.dart';

class AddressRepo {
  Future<List<AddressModel>> addressList() async {
    List<AddressModel> addressesList = [];
    try {
      final response = await BaseHttpClient().get('users/address/');
      if (response != null) {
        final addresses = jsonDecode(response) as List<dynamic>;
        for (var address in addresses) {
          try {
            addressesList.add(
              AddressModel.fromMap(
                address,
              ),
            );
          } catch (e) {
            log('Individual address number $address: $e');
          }
        }
      }
    } catch (e) {
      log('Someting wrong in addresses: $e');
    }

    return addressesList;
  }

  addressCreate(AddressModel address) async {
    try {
      final response = await BaseHttpClient().post(
        'users/address/',
        address.toMap(),
      );
      if (response != null) {}
    } catch (e) {
      log('Someting wrong in addresses: $e');
    }
  }

  addressUpdate(AddressModel address) async {
    try {
      final response = await BaseHttpClient().put(
        'users/address/${address.id}/',
        address.toMap(),
      );
      if (response != null) {}
    } catch (e) {
      log('Someting wrong in addresses: $e');
    }
  }

  addressDelete(String id) async {
    try {
      final response = await BaseHttpClient().delete(
        'users/address/$id/',
      );
      if (response != null) {}
    } catch (e) {
      log('Someting wrong in addresses: $e');
    }
  }
}
