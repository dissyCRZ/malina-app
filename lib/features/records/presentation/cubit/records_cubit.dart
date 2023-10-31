import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/records/data/models/record.dart';
import 'package:malina_mobile_app/features/records/data/repositories/records_repo.dart';

part 'records_state.dart';

class RecordsCubit extends Cubit<RecordsState> {
  RecordsCubit() : super(const RecordsState([]));
  load() async {
    final records = await RecordsRepo().recordsList();
    emit(
      RecordsState(
        records,
      ),
    );
  }

  empty() {
    emit(
      const RecordsState(
        [],
      ),
    );
  }

  Future<RecordModel?> addRecord(RecordModel record) async {
    final newRecord = await RecordsRepo().addRecord(record);
    if (newRecord != null) {
      emit(
        RecordsState(
          [
            ...super.state.records,
            newRecord,
          ],
        ),
      );
    }
    return newRecord;
  }
}
