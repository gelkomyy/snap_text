String convertTo12HourFormat(String time24HourFormat) {
  List<String> parts = time24HourFormat.split(':');
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);

  String period = 'AM';
  if (hour >= 12) {
    period = 'PM';
    if (hour > 12) {
      hour -= 12;
    }
  }
  if (hour == 0) {
    hour = 12;
  }

  String hourString = hour.toString().padLeft(2, '0');
  return '$hourString:${minute.toString().padLeft(2, '0')} $period';
}
