import 'package:design_system/src/foundations/foundations.dart';
import 'package:design_system/src/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

/// Class responsible to set colors to each theme/mode.
class AppColorsData extends Equatable {
  /// Creates a new instance of [AppColorsData].
  const AppColorsData({
    required this.background,
    required this.backgroundActive,
    required this.backgroundDisabled,
    required this.backgroundHover,
    required this.backgroundInteractive,
    required this.backgroundSuccess,
    required this.backgroundDanger,
    required this.backgroundWarning,
    required this.brand,
    required this.font,
    required this.fontActive,
    required this.fontDisabled,
    required this.fontHover,
    required this.fontInteractive,
    required this.fontSuccess,
    required this.fontDanger,
    required this.fontWarning,
    required this.buttonFontColor,
    required this.buttonBackgroundColor,
    required this.buttonActiveBackgroundColor,
    required this.buttonDisabledBackgroundColor,
    required this.buttonHoverBackgroundColor,
  });

  /// Color scheme for Dark mode
  factory AppColorsData.dark() => const AppColorsData(
        background: ColorTokens.backgroundSecondary,
        backgroundActive: ColorTokens.backgroundActive,
        backgroundDisabled: ColorTokens.backgroundDisabled,
        backgroundHover: ColorTokens.backgroundHover,
        backgroundInteractive: ColorTokens.backgroundInteractive,
        backgroundSuccess: ColorTokens.backgroundSuccess,
        backgroundDanger: ColorTokens.backgroundSuccess,
        backgroundWarning: ColorTokens.backgroundWarning,
        brand: ColorTokens.brandPrimaryDark,
        font: ColorTokens.fontPrimary,
        fontActive: ColorTokens.fontActive,
        fontDisabled: ColorTokens.fontDisabled,
        fontHover: ColorTokens.fontHover,
        fontInteractive: ColorTokens.fontInteractive,
        fontSuccess: ColorTokens.fontSuccess,
        fontDanger: ColorTokens.fontDanger,
        fontWarning: ColorTokens.fontWarning,
        buttonFontColor: ComponentTokens.buttonFontColor,
        buttonBackgroundColor: ComponentTokens.buttonPrimaryBackgroundColor,
        buttonActiveBackgroundColor:
            ComponentTokens.buttonActiveBackgroundColor,
        buttonDisabledBackgroundColor:
            ComponentTokens.buttonDisabledBackgroundColor,
        buttonHoverBackgroundColor: ComponentTokens.buttonHoverBackgroundColor,
      );

  /// Color scheme for Light mode
  factory AppColorsData.light() => const AppColorsData(
        background: ColorTokens.backgroundPrimary,
        backgroundActive: ColorTokens.backgroundActive,
        backgroundDisabled: ColorTokens.backgroundDisabled,
        backgroundHover: ColorTokens.backgroundHover,
        backgroundInteractive: ColorTokens.backgroundInteractive,
        backgroundSuccess: ColorTokens.backgroundSuccess,
        backgroundDanger: ColorTokens.backgroundSuccess,
        backgroundWarning: ColorTokens.backgroundWarning,
        brand: ColorTokens.brandPrimaryBase,
        font: ColorTokens.fontSecondary,
        fontActive: ColorTokens.fontActive,
        fontDisabled: ColorTokens.fontDisabled,
        fontHover: ColorTokens.fontHover,
        fontInteractive: ColorTokens.fontInteractive,
        fontSuccess: ColorTokens.fontSuccess,
        fontDanger: ColorTokens.fontDanger,
        fontWarning: ColorTokens.fontWarning,
        buttonFontColor: ComponentTokens.buttonFontColor,
        buttonBackgroundColor: ComponentTokens.buttonPrimaryBackgroundColor,
        buttonActiveBackgroundColor:
            ComponentTokens.buttonActiveBackgroundColor,
        buttonDisabledBackgroundColor:
            ComponentTokens.buttonDisabledBackgroundColor,
        buttonHoverBackgroundColor: ComponentTokens.buttonHoverBackgroundColor,
      );

  /// Primary background color.
  final Color background;

  /// Background color for Active elements.
  final Color backgroundActive;

  /// Background color for Disable elements.
  final Color backgroundDisabled;

  /// Background color for Hover elements.
  final Color backgroundHover;

  /// Background color for Interactive elements.
  final Color backgroundInteractive;

  /// Background color for Success elements.
  final Color backgroundSuccess;

  /// Background color for Danger/Errors elements.
  final Color backgroundDanger;

  /// Background color for Warning elements.
  final Color backgroundWarning;

  /// Primary brand color.
  final Color brand;

  /// Primary font color.
  final Color font;

  /// Font color for Active elements.
  final Color fontActive;

  /// Font color for Disable elements.
  final Color fontDisabled;

  /// Font color for Hover elements.
  final Color fontHover;

  /// Font color for Interactive elements.
  final Color fontInteractive;

  /// Font color for Success elements.
  final Color fontSuccess;

  /// Font color for Danger elements.
  final Color fontDanger;

  /// Font color for Warning elements.
  final Color fontWarning;

  /// Button widget font color
  final Color buttonFontColor;

  /// Button widget background color
  final Color buttonBackgroundColor;

  /// Button widget Active background color
  final Color buttonActiveBackgroundColor;

  /// Button widget Disable background color
  final Color buttonDisabledBackgroundColor;

  /// Button widget Hover background color
  final Color buttonHoverBackgroundColor;

  @override
  List<Object?> get props => [
        background.named('background'),
        backgroundActive.named('backgroundActive'),
        backgroundDisabled.named('backgroundDisabled'),
        backgroundHover.named('backgroundHover'),
        backgroundInteractive.named('backgroundInteractive'),
        backgroundSuccess.named('backgroundSuccess'),
        backgroundDanger.named('backgroundDanger'),
        backgroundWarning.named('backgroundWarning'),
        brand.named('brand'),
        font.named('font'),
        fontActive.named('fontActive'),
        fontDisabled.named('fontDisabled'),
        fontHover.named('fontHover'),
        fontInteractive.named('fontInteractive'),
        fontSuccess.named('fontSuccess'),
        fontDanger.named('fontDanger'),
        fontWarning.named('fontWarning'),
        buttonFontColor.named('buttonFontColor'),
        buttonBackgroundColor.named('buttonBackgroundColor'),
        buttonActiveBackgroundColor.named('buttonActiveBackgroundColor'),
        buttonDisabledBackgroundColor.named('buttonDisabledBackgroundColor'),
        buttonHoverBackgroundColor.named('buttonHoverBackgroundColor'),
      ];
}
