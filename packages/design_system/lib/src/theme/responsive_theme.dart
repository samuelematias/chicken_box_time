import 'dart:ui' as ui;

import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/widgets.dart';

/// Enum with possible brightness mode.
enum AppThemeColorMode {
  /// Light brightness mode.
  light,

  /// Dark brightness mode.
  dark,
}

/// Updates automatically the [AppTheme] regarding the current [MediaQuery],
/// as soon as the theme isn't overriden.
class AppResponsiveTheme extends StatelessWidget {
  /// Creates a new instance of [AppResponsiveTheme].
  const AppResponsiveTheme({
    Key? key,
    required this.child,
    this.colorMode,
    this.formFactor,
  }) : super(key: key);

  /// Receive the actual brightness/theme mode.
  final AppThemeColorMode? colorMode;

  ///
  final AppFormFactor? formFactor;

  /// Receive the [child] as [Widget].
  final Widget child;

  /// Method responsible to handle the brightness/theme mode.
  static AppThemeColorMode colorModeOf(BuildContext context) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final useDarkTheme = platformBrightness == ui.Brightness.dark;
    if (useDarkTheme) {
      return AppThemeColorMode.dark;
    }

    return AppThemeColorMode.light;
  }

  /// Method responsible to identify the [AppFormFactor].
  static AppFormFactor formFactorOf(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    if (mediaQuery.size.width < 200) {
      return AppFormFactor.small;
    }

    return AppFormFactor.medium;
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      data: AppThemeData.regular(),
      child: child,
    );
  }
}
