class Utils {
  static String uuid() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  static int uuidInteger() {
    final now = DateTime.now();
    return now.millisecondsSinceEpoch;
  }

  static bool isValidUrl(String urlString) {
    return Uri.parse(urlString).isAbsolute;

    Uri? uri = Uri.tryParse(urlString);
    // Verifica se o parsing foi bem-sucedido e se o esquema (scheme) é "http" ou "https"
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  static bool isDouble(String value) {
    // Try to parse the string as a double
    double? parsedValue = double.tryParse(value);
    return parsedValue != null;
  }
}
