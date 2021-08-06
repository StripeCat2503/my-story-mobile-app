import 'package:intl/intl.dart';

class Utils {
  static String convertDateToString(
      {DateTime? date, String? format, String locale = 'en-US'}) {
    return DateFormat(format, locale).format(date!);
  }
}
