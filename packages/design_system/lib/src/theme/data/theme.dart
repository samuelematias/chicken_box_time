import 'package:design_system/src/theme/data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// Class responsible to make available,
/// the [AppThemeData] with all other data.
class AppThemeData extends Equatable {
  /// Creates a new instance of [AppThemeData].
  const AppThemeData({
    required this.icons,
    required this.colors,
    required this.typography,
    required this.spacing,
    required this.formFactor,
    TargetPlatform? platform,
  }) : _platform = platform;

  /// Set each other data.
  factory AppThemeData.regular() => AppThemeData(
        formFactor: AppFormFactor.medium,
        icons: AppIconsData.regular(),
        typography: AppTypographyData.regular(),
        colors: AppColorsData.light(),
        spacing: AppSpacingData.regular(),
      );

  /// Reference the icons data.
  final AppIconsData icons;

  /// Reference the colors data.
  final AppColorsData colors;

  /// Reference the typography data.
  final AppTypographyData typography;

  /// Reference the spacing data.
  final AppSpacingData spacing;

  /// Reference the formFactor data.
  final AppFormFactor formFactor;

  /// Reference the [TargetPlatform].
  final TargetPlatform? _platform;

  /// Get the [TargetPlatform] value.
  TargetPlatform get platform => defaultTargetPlatform;

  @override
  List<Object?> get props => [
        platform,
        icons,
        colors,
        typography,
        spacing,
      ];

  ///
  AppThemeData withColors(AppColorsData colors) {
    return AppThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      icons: icons,
      spacing: spacing,
      typography: typography,
    );
  }

  ///
  AppThemeData withFormFactor(AppFormFactor formFactor) {
    return AppThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      icons: icons,
      spacing: spacing,
      typography: typography,
    );
  }

  ///
  AppThemeData withTypography(AppTypographyData typography) {
    return AppThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      icons: icons,
      spacing: spacing,
      typography: typography,
    );
  }
}
