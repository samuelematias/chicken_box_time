import 'package:design_system/src/theme/data/data.dart';
import 'package:flutter/widgets.dart';

export 'data/data.dart';
export 'responsive_theme.dart';

/// Class responsible to handle the switch brightness mode.
class AppTheme extends InheritedWidget {
  /// Creates a new instance of [AppTheme].
  const AppTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  ///Receive the entire [AppThemeData].
  final AppThemeData data;

  /// Method to make available the theme cross the entire App.
  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    return widget!.data;
  }

  /// Method to check is necessary rebuild the widget tree,
  /// to update the brightness mode/theme.
  /// e.g. Change the Light mode to Dark mode.
  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}
