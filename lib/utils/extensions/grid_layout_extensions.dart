import 'package:flutter/widgets.dart';

/// {@template welcome_page}
/// A collection of Grid layot extensions.
/// {@endtemplate}
extension GridLayotExtensions on BuildContext {
  /// Extension to get the full screen width.
  double get width => MediaQuery.of(this).size.width;

  /// Extension to get the full screen height.
  double get height => MediaQuery.of(this).size.height;

  /// Extension to get the Grid template columns 1.
  double get gridColumns1 => 8.33 / 100 * MediaQuery.of(this).size.width;

  /// Extension to get the Grid template columns 2.
  double get gridColumns2 => 16.66 / 100 * MediaQuery.of(this).size.width;

  /// Extension to get the Grid template columns 3.
  double get gridColumns3 => 25 / 100 * MediaQuery.of(this).size.width;

  /// Extension to get the Grid template columns 4.
  double get gridColumns4 => 33.33 / 100 * MediaQuery.of(this).size.width;

  /// Extension to get the Grid template columns 5.
  double get gridColumns5 => 41.66 / 100 * MediaQuery.of(this).size.width;

  /// Extension to get the Grid template columns 6.
  double get gridColumns6 => 50 / 100 * MediaQuery.of(this).size.width;

  /// Extension to get the Grid template columns 7.
  double get gridColumns7 => 58.33 / 100 * MediaQuery.of(this).size.width;

  /// Extension to get the Grid template columns 8.
  double get gridColumns8 => 66.66 / 100 * MediaQuery.of(this).size.width;

  /// Extension to get the Grid template columns 9.
  double get gridColumns9 => 75 / 100 * MediaQuery.of(this).size.width;

  /// Extension to get the Grid template columns 10.
  double get gridColumns10 => 83.33 / 100 * MediaQuery.of(this).size.width;

  /// Extension to get the Grid template columns 11.
  double get gridColumns11 => 91.66 / 100 * MediaQuery.of(this).size.width;

  /// Extension to get the Grid template columns 12.
  double get gridColumns12 => 100 / 100 * MediaQuery.of(this).size.width;
}
