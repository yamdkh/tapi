class DateTimeUtil {
  static String onlyDate(DateTime dateTime) {
    return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
  }
}
