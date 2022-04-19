/// A collection of [String] class/type extensions, focus on
/// movie api improments.
extension StringExtensions on String {
  /// Extension to get the movie thumbnail.
  String getMovieThumbnail() {
    return 'https://image.tmdb.org/t/p/w500/$this';
  }
}
