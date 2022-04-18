import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/widgets.dart';

/// Enum with possibilitie icon sizes.
enum IconSize {
  /// Representation of the small icon size.
  small,

  /// Representation of the regular icon size.
  regular,

  /// Representation of the big icon size.
  big,
}

/// A collection of [AppIconSizesData] class/type extensions.
extension AppIconSizeExtension on AppIconSizesData {
  /// Resolve the app icons size.
  double resolve(IconSize size) {
    switch (size) {
      case IconSize.small:
        return small;
      case IconSize.regular:
        return regular;
      case IconSize.big:
        return big;
    }
  }
}

/// Class responsible to handle the icon size.
class Icon extends StatelessWidget {
  /// Creates a new instance of [AnimatedIcon].
  const Icon(
    this.data, {
    Key? key,
    this.color,
    this.size = IconSize.regular,
  }) : super(key: key);

  /// Representation of the small icon.
  const Icon.small(
    this.data, {
    Key? key,
    this.color,
  })  : size = IconSize.small,
        super(key: key);

  /// Representation of the regular icon.
  const Icon.regular(
    this.data, {
    Key? key,
    this.color,
  })  : size = IconSize.regular,
        super(key: key);

  /// Representation of the big icon.
  const Icon.big(
    this.data, {
    Key? key,
    this.color,
  })  : size = IconSize.big,
        super(key: key);

  /// The icon content.
  final String data;

  /// The icon color.
  final Color? color;

  /// The icon size.
  final IconSize size;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = this.color ?? theme.colors.background;
    return Text(
      data,
      style: TextStyle(
        fontFamily: theme.icons.fontFamily,
        package: theme.icons.fontPackage,
        color: color,
        fontSize: theme.icons.sizes.resolve(size),
        decoration: TextDecoration.none,
      ),
    );
  }
}

/// Class responsible to handle the animated icon size.
class AnimatedIcon extends StatelessWidget {
  /// Creates a new instance of [AnimatedIcon].
  const AnimatedIcon(
    this.data, {
    Key? key,
    this.color,
    this.size = IconSize.small,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  /// The icon content.
  final String data;

  /// The icon color.
  final Color? color;

  /// The icon size.
  final IconSize size;

  /// The icon animation duration.
  final Duration duration;

  /// Check if the icon is animated.
  bool get isAnimated => duration.inMilliseconds > 0;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = this.color ?? theme.colors.background;
    if (!isAnimated) {
      return Icon(
        data,
        key: key,
        color: color,
        size: size,
      );
    }
    return AnimatedDefaultTextStyle(
      style: TextStyle(
        fontFamily: theme.icons.fontFamily,
        package: theme.icons.fontPackage,
        color: color,
        fontSize: theme.icons.sizes.resolve(size),
        decoration: TextDecoration.none,
      ),
      duration: duration,
      child: Text(
        data,
      ),
    );
  }
}
