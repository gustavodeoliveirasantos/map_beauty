class Utils {
  static String uuid() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  static int uuidInteger() {
    final now = DateTime.now();
    return now.millisecondsSinceEpoch;
  }
}
