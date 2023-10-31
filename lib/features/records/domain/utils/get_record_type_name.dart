import 'package:malina_mobile_app/features/records/data/enums/record_type.dart';

String getRecordTypeName(RecordTypeEnum type) {
  switch (type) {
    case RecordTypeEnum.upcoming:
      return 'Подтверждено';
    case RecordTypeEnum.visited:
      return 'Посещено';
  }
}
