extension StringExtension on String {
  String slugify() {
    return trim()
        .toLowerCase()
        .replaceAll(RegExp('[^a-z]'), '');
  }
}
