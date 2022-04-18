import 'package:design_system/src/foundations/foundations.dart';
import 'package:design_system/src/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

/// Class responsible to make available,
/// the semantic spacings, AKA paddings.
class AppSpacingData extends Equatable {
  /// Creates a new instance of [AppSpacingData].
  const AppSpacingData({
    required this.xxSmall,
    required this.xSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.xl,
  });

  /// Set each spacing.
  factory AppSpacingData.regular() => const AppSpacingData(
        xxSmall: SizeTokens.paddingXxSmall,
        xSmall: SizeTokens.paddingXSmall,
        small: SizeTokens.paddingSmall,
        medium: SizeTokens.paddingMedium,
        large: SizeTokens.paddingLarge,
        xl: SizeTokens.paddingXl,
      );

  /// [xxSmall] spacing.
  final double xxSmall;

  /// [xSmall] spacing.
  final double xSmall;

  /// [small] spacing.
  final double small;

  /// [medium] spacing.
  final double medium;

  /// [large] spacing.
  final double large;

  /// [xl] spacing.
  final double xl;

  /// Method to convert the spacings, AKA paddings, to EdgeInsets,
  /// the Flutter type/way to work with paddings.
  AppEdgeInsetsSpacingData asInsets() => AppEdgeInsetsSpacingData(this);

  @override
  List<Object?> get props => [
        xxSmall.named('xxSmall'),
        xSmall.named('xSmall'),
        small.named('small'),
        medium.named('medium'),
        large.named('large'),
        xl.named('xl'),
      ];
}

/// Class responsible to convert the spacings, AKA paddings, to EdgeInsets,
/// the Flutter type/way to work with paddings.
class AppEdgeInsetsSpacingData extends Equatable {
  /// Creates a new instance of [AppEdgeInsetsSpacingData].
  const AppEdgeInsetsSpacingData(
    this._spacing,
  );

  /// EdgeInsets [xxSmall] spacing.
  EdgeInsets get xxSmall => EdgeInsets.all(_spacing.xxSmall);

  /// EdgeInsets [xSmall] spacing.
  EdgeInsets get xSmall => EdgeInsets.all(_spacing.xSmall);

  /// EdgeInsets [small] spacing.
  EdgeInsets get small => EdgeInsets.all(_spacing.small);

  /// EdgeInsets [medium] spacing.
  EdgeInsets get medium => EdgeInsets.all(_spacing.medium);

  /// EdgeInsets [large] spacing.
  EdgeInsets get large => EdgeInsets.all(_spacing.large);

  /// EdgeInsets [xl] spacing.
  EdgeInsets get xl => EdgeInsets.all(_spacing.xl);

  final AppSpacingData _spacing;

  @override
  List<Object?> get props => [_spacing];
}
