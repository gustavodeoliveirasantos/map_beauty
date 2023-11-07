import 'dart:ui';

class HexColor extends Color {
  static int _getColor(String hex) {
    String formattedHex = "FF${hex.toUpperCase().replaceAll("#", "")}";
    return int.parse(formattedHex, radix: 16);
  }

  HexColor(final String hex) : super(_getColor(hex));
}

extension DateTimeExtension on DateTime {
  DateTime next(int day) {
    return add(
      Duration(
        days: (day - weekday) % DateTime.daysPerWeek,
      ),
    );
  }

  bool isSameDay(DateTime date) {
    return day == date.day && month == date.month && year == date.year;
  }

  bool isSameDayAndMonth(DateTime date) {
    return day == date.day && month == date.month;
  }

  bool isSameDayMonthYear(DateTime date) {
    return day == date.day && month == date.month && year == date.year;
  }
}

extension DurationExtension on Duration {
  String toHourMinuteString() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    // String twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    return "${twoDigits(inHours)}:$twoDigitMinutes";
  }
}
