part of 'records_cubit.dart';

class RecordsState extends Equatable {
  final List<RecordModel> records;
  const RecordsState(
    this.records,
  );

  @override
  List<Object> get props => [records];
}
