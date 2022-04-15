/// A collection of [String] class/type extensions.
extension StringExtensions on String {
  /// Extension to [capitalize] the first letter of the word.
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
