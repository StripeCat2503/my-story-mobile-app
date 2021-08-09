import 'package:my_story/src/utils/utils.dart';

class Helpers {
  static String getPostDate(DateTime dateTime) {
    String time = Utils.convertDateToString(date: dateTime, format: 'hh:mm a');

    String date =
        Utils.convertDateToString(date: dateTime, format: 'MMM dd, yyyy');
    return '$time - $date';
  }
}
