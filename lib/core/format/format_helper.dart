import 'package:intl/intl.dart';

extension DateTimeExtend on DateTime {
  String get yMdFormat => DateFormat.yMd().format(this);

  String get hourMinuteFormat => DateFormat("hh:mm a").format(this);

  String get weekDayFormat => DateFormat(DateFormat.WEEKDAY).format(this);
}

extension StringExtend on String {
  DateTime get dateTimeFormat => DateTime.parse(this);
}
