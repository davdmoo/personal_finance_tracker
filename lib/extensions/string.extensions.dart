extension StringExt on String {
  String get capitalized {
    if (isEmpty) return this;

    final firstLetter = this[0];
    return "${firstLetter.toUpperCase()}${substring(1)}";
  }
}
