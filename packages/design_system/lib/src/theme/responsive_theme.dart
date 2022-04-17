import 'dart:ui' as ui;

import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    required this.appLogo,
    this.darkAppLogo,
  }) : super(key: key);

  /// Receive the actual brightness/theme mode.
  final AppThemeColorMode? colorMode;

  /// Receive the value of medium/small,
  /// for typography usecases.
  final AppFormFactor? formFactor;

  /// The appLogo in Light brightness mode.
  final PictureProvider appLogo;

  /// The appLogo in Dark brightness mode.
  final PictureProvider? darkAppLogo;

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
    var theme = AppThemeData.regular(appLogo: appLogo);

    /// Updating the colors for the current brightness
    final colorMode = this.colorMode ?? colorModeOf(context);
    switch (colorMode) {
      case AppThemeColorMode.dark:
        theme = theme.withColors(AppColorsData.dark());

        final darkAppLogo = this.darkAppLogo;
        if (darkAppLogo != null) {
          theme = theme.withImages(theme.images.withAppLogo(darkAppLogo));
        }
        break;
      case AppThemeColorMode.light:
        break;
    }

    // Updating the sizes for current form factor.
    var formFactor = this.formFactor ?? formFactorOf(context);
    theme = theme.withFormFactor(formFactor);
    if (formFactor == AppFormFactor.small) {
      theme = theme.withTypography(AppTypographyData.regular());
    }

    return AppTheme(
      data: theme,
      child: child,
    );
  }
}
