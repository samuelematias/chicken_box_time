import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart' hide Text, Icon;

/// The [Button] widget.
class Button extends StatelessWidget {
  /// Creates a new instance of [Button].
  const Button({
    Key? key,
    this.icon,
    this.title,
    this.onTap,
    this.mainAxisSize = MainAxisSize.min,
  })  : assert(
          icon != null || title != null,
          'The icon and title parameter, cant be null.',
        ),
        super(key: key);

  /// The button icon.
  final String? icon;

  /// The button label.
  final String? title;

  /// The button content position.
  final MainAxisSize mainAxisSize;

  /// The button press function.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TapBuilder(
      onTap: onTap,
      builder: (context, state) {
        switch (state) {
          case TapState.hovered:
            return Semantics(
              enabled: true,
              selected: true,
              child: ButtonLayout.hovered(
                icon: icon,
                title: title,
                mainAxisSize: mainAxisSize,
              ),
            );
          case TapState.pressed:
            return Semantics(
              enabled: true,
              selected: true,
              child: ButtonLayout.pressed(
                icon: icon,
                title: title,
                mainAxisSize: mainAxisSize,
              ),
            );
          case TapState.focused:
          case TapState.inactive:
          case TapState.disabled:
            return Semantics(
              enabled: true,
              selected: true,
              child: ButtonLayout.inactive(
                icon: icon,
                title: title,
                mainAxisSize: mainAxisSize,
              ),
            );
        }
      },
    );
  }
}

/// Enum with possibilitie states of the button.
enum ButtonState {
  /// Representation of the inactive state of the button.
  inactive,

  /// Representation of the hovered state of the button.
  hovered,

  /// Representation of the pressed state of the button.
  pressed,
}

/// Class responsible to handle the button states.
class ButtonLayout extends StatelessWidget {
  /// Representation of the inactive button.
  const ButtonLayout.inactive({
    Key? key,
    this.icon,
    this.title,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.foregroundColor,
  })  : _state = ButtonState.inactive,
        assert(
          icon != null || title != null,
          'The icon and title parameter, cant be null.',
        ),
        super(key: key);

  /// Representation of the hovered button.
  const ButtonLayout.hovered({
    Key? key,
    this.icon,
    this.title,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.foregroundColor,
  })  : _state = ButtonState.hovered,
        assert(
          icon != null || title != null,
          'The icon and title parameter, cant be null.',
        ),
        super(key: key);

  /// Representation of the pressed button.
  const ButtonLayout.pressed({
    Key? key,
    this.icon,
    this.title,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.foregroundColor,
  })  : _state = ButtonState.pressed,
        assert(
          icon != null || title != null,
          'The icon and title parameter, cant be null.',
        ),
        super(key: key);

  /// The button icon.
  final String? icon;

  /// The button label.
  final String? title;

  /// The button content position.
  final MainAxisSize mainAxisSize;

  /// The button state.
  final ButtonState _state;

  /// The button background color for the inactive state.
  final Color? inactiveBackgroundColor;

  /// The button background color for the hovered state.
  final Color? hoveredBackgroundColor;

  /// The button background color for the pressed state.
  final Color? pressedBackgroundColor;

  /// The button foreground color.
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final title = this.title;
    final icon = this.icon;
    final hasBoth = title != null && icon != null;
    final backgroundColor = () {
      switch (_state) {
        case ButtonState.inactive:
          return inactiveBackgroundColor ??
              theme.colors.buttonActiveBackgroundColor;
        case ButtonState.hovered:
          return hoveredBackgroundColor ??
              theme.colors.buttonHoverBackgroundColor;
        case ButtonState.pressed:
          return pressedBackgroundColor ??
              theme.colors.buttonActiveBackgroundColor;
      }
    }();
    final fontcolor = () {
      switch (_state) {
        case ButtonState.inactive:
          return inactiveBackgroundColor ?? theme.colors.buttonFontColor;
        case ButtonState.hovered:
          return hoveredBackgroundColor ??
              theme.colors.buttonFontColor.withOpacity(0.50);
        case ButtonState.pressed:
          return pressedBackgroundColor ??
              theme.colors.buttonFontColor.withOpacity(0.50);
      }
    }();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: theme.spacing.xSmall,
        horizontal: title != null ? theme.spacing.medium : theme.spacing.xSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Text(
              title,
              style: CustomTextStyle.labelSmall,
              color: fontcolor,
            ),
          ],
          if (hasBoth) ...[
            SizedBox(
              width: theme.spacing.xSmall,
            ),
          ],
          if (icon != null) ...[
            Icon.regular(
              icon,
              color: fontcolor,
            ),
          ],
        ],
      ),
    );
  }
}
