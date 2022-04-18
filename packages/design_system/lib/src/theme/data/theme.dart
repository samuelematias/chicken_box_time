import 'package:design_system/src/theme/data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    required this.images,
    TargetPlatform? platform,
  }) : _platform = platform;

  /// Set each other data.

  factory AppThemeData.regular({
    required PictureProvider appLogo,
  }) =>
      AppThemeData(
        formFactor: AppFormFactor.medium,
        icons: AppIconsData.regular(),
        typography: AppTypographyData.regular(),
        colors: AppColorsData.light(),
        spacing: AppSpacingData.regular(),
        images: AppImagesData.regular(
          appLogo: appLogo,
        ),
      );

  /// Reference the [icons] data.
  final AppIconsData icons;

  /// Reference the [colors] data.
  final AppColorsData colors;

  /// Reference the [typography] data.
  final AppTypographyData typography;

  /// Reference the [spacing] data.
  final AppSpacingData spacing;

  /// Reference the [formFactor] data.
  final AppFormFactor formFactor;

  /// Reference the [images] data.
  final AppImagesData images;

  /// This variable is used later on,
  /// although it says it is not being used.
  /// Reference the [TargetPlatform].
  // ignore: unused_field
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
        images,
      ];

  /// Update the current [colors] value.
  AppThemeData withColors(AppColorsData colors) {
    return AppThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      icons: icons,
      spacing: spacing,
      typography: typography,
      images: images,
    );
  }

  /// Update the current [formFactor] value.
  AppThemeData withFormFactor(AppFormFactor formFactor) {
    return AppThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      icons: icons,
      spacing: spacing,
      typography: typography,
      images: images,
    );
  }

  /// Update the current [typography] value.
  AppThemeData withTypography(AppTypographyData typography) {
    return AppThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      icons: icons,
      spacing: spacing,
      typography: typography,
      images: images,
    );
  }

  /// Update the current [images] value.
  AppThemeData withImages(AppImagesData images) {
    return AppThemeData(
      platform: platform,
      formFactor: formFactor,
      colors: colors,
      icons: icons,
      spacing: spacing,
      typography: typography,
      images: images,
    );
  }
}
