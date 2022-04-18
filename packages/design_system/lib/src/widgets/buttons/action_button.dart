import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';

/// The [ActionButton] widget.
class ActionButton extends StatelessWidget {
  /// Creates a new instance of [ActionButton].
  const ActionButton({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  /// The button icon.
  final String icon;

  /// The button press function.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TapBuilder(
      onTap: onTap,
      builder: (context, state) {
        switch (state) {
          case TapState.hovered:
            return ActionButtonLayout.hovered(
              icon: icon,
            );
          case TapState.pressed:
            return ActionButtonLayout.pressed(
              icon: icon,
            );
          case TapState.focused:
          case TapState.inactive:
          case TapState.disabled:
            return ActionButtonLayout.inactive(
              icon: icon,
            );
          // default:
        }
      },
    );
  }
}

/// Class responsible to handle the action button states.
class ActionButtonLayout extends StatelessWidget {
  /// Representation of the inactive action button.
  const ActionButtonLayout.inactive({
    Key? key,
    required this.icon,
  })  : _state = ButtonState.inactive,
        super(key: key);

  /// Representation of the hovered action button.
  const ActionButtonLayout.hovered({
    Key? key,
    required this.icon,
  })  : _state = ButtonState.hovered,
        super(key: key);

  /// Representation of the pressed action button.
  const ActionButtonLayout.pressed({
    Key? key,
    required this.icon,
  })  : _state = ButtonState.pressed,
        super(key: key);

  /// The button icon.
  final String icon;

  /// The button state.
  final ButtonState _state;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    switch (_state) {
      case ButtonState.hovered:
        return ButtonLayout.hovered(
          icon: icon,
          hoveredBackgroundColor:
              theme.colors.buttonHoverBackgroundColor.withOpacity(0.15),
        );
      case ButtonState.pressed:
        return ButtonLayout.pressed(
          icon: icon,
          pressedBackgroundColor:
              theme.colors.buttonActiveBackgroundColor.withOpacity(0.20),
        );
      case ButtonState.inactive:
        return ButtonLayout.inactive(
          icon: icon,
          inactiveBackgroundColor:
              theme.colors.buttonDisabledBackgroundColor.withOpacity(0),
        );
    }
  }
}
