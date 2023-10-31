import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/repositories/beauty_repo.dart';
import 'package:malina_mobile_app/features/records/data/models/record.dart';
import 'package:malina_mobile_app/shared/classes/base_http_client.dart';

class RecordsRepo {
  Future<List<RecordModel>> recordsList() async {
    List<RecordModel> records = [];
    final response = await BaseHttpClient().get('beauty/beauty_appointments/');
    if (response != null) {
      try {
        final body = jsonDecode(response)['results'] as List;
        for (final record in body) {
          try {
            final specialist = await BeautyRepo().getSpecialist(
              record['appointment_master'],
            );
            final place =
                await BeautyRepo().getBusiness(specialist!.businessId);
            records.add(
              RecordModel.fromMap(
                record,
                specialist,
                place!,
              ),
            );
          } catch (e) {
            log('Record from map - ${record["id"]}:$e');
          }
        }
      } catch (e) {
        log('Someting wrong in businessesList: $e');
      }
    }
    return records;
  }

  Future<RecordModel?> addRecord(RecordModel record) async {
    try {
      final response =
          await BaseHttpClient().post('beauty/beauty_appointments/', {
        "appointment_master": record.specialist.id,
        "appointment_time": DateFormat("yyyy-MM-ddTHH:mm:ssZ").format(
          record.time,
        ),
        "appointment_services": record.services,
        "comment": record.comment,
        "name": record.name,
        "phone": record.phone,
      });
      if (response != null) {
        log(response.toString());
        final record = jsonDecode(response);
        final specialist = await BeautyRepo().getSpecialist(
          record['appointment_master'],
        );
        final place = await BeautyRepo().getBusiness(specialist!.businessId);
        return RecordModel.fromMap(
          record,
          specialist,
          place!,
        );
      }
    } catch (e) {
      log('Someting wrong in businessesList: $e');
    }
    return null;
  }
}
