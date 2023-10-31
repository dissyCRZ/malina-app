import 'package:flutter/material.dart';
import 'package:malina_mobile_app/features/records/presentation/pages/added_record_thanks.dart';

Future<dynamic> addedRecordThanksBottomSheet(
  BuildContext buildContext,
  String id,
) {
  return showModalBottomSheet(
    context: buildContext,
    builder: (context) => AddedRecordThanksSheet(
      id: id,
    ),
    isScrollControlled: true,
  );
}
