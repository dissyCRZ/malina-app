import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  bool operator <(DateTime other) {
    return millisecondsSinceEpoch < other.millisecondsSinceEpoch;
  }

  bool operator >(DateTime other) {
    return millisecondsSinceEpoch > other.millisecondsSinceEpoch;
  }

  bool operator >=(DateTime other) {
    return millisecondsSinceEpoch >= other.millisecondsSinceEpoch;
  }

  bool operator <=(DateTime other) {
    return millisecondsSinceEpoch <= other.millisecondsSinceEpoch;
  }

  String localizedTimeOfDay(BuildContext context) {
    initializeDateFormatting(
      'ru',
    );
    final weekName = DateFormat('EEEE', 'ru').format(this).substring(0, 2);
    final monthName = DateFormat('MMMM', 'ru').format(this).substring(0, 3);
    final timeFormat = DateFormat('hh:mm').format(this);
    return '$weekName $day $monthName $timeFormat';
  }

  String dayMonthYear(BuildContext context) {
    return '${day.toString().padLeft(2, "0")}.${month.toString().padLeft(2, "0")}.$year';
  }

  String timedayMonthYear(BuildContext context) {
    return '${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}  ${day.toString().padLeft(2, "0")}.${month.toString().padLeft(2, "0")}.$year';
  }
}
