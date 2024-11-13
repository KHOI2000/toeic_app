extension StringExt on String {
  String get lastChar => substring(length - 1);
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
