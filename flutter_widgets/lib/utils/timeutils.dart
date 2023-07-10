import 'package:intl/intl.dart';


class TimeFormat{
  static const TIME_FORMAT_FULL = "yyyy-MM-dd hh:mm:ss";
  static const TIME_FORMAT_DAY = "yyyy-MM-dd";
}
class TimeUtil{

  static String getCurrentFullTime(){
    final now = DateTime.now();
    return DateFormat(TimeFormat.TIME_FORMAT_FULL).format(now);
  }

  static String  getDayTime() {
    final now = DateTime.now();
    return DateFormat(TimeFormat.TIME_FORMAT_DAY).format(now);
  }
}