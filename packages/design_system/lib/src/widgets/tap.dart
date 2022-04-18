import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Enum with possibilitie states of tap.
enum TapState {
  /// Representation of the disabled state.
  disabled,

  /// Representation of the inactive state.
  inactive,

  /// Representation of the focused state.
  focused,

  /// Representation of the hovered state.
  hovered,

  /// Representation of the pressed state.
  pressed,
}

/// Type definition of a widget function.
typedef TapWidgetBuilder = Widget Function(
  BuildContext context,
  TapState state,
);

/// Class responsible to builder the tap.
class TapBuilder extends StatefulWidget {
  /// Creates a new instance of [TapBuilder].
  const TapBuilder({
    Key? key,
    required this.builder,
    this.onTap,
    this.canRequestFocus = true,
    this.excludeFromSemantics = false,
    this.autofocus = false,
    this.focusNode,
    this.mouseCursor,
  }) : super(key: key);

  /// Receive the widget builder.
  final TapWidgetBuilder builder;

  /// Receive the onpress/ontap function.
  final VoidCallback? onTap;

  /// An object that can be used by a stateful widget to
  /// obtain the keyboard focus
  /// and to handle keyboard events.
  final FocusNode? focusNode;

  /// Focus automatically the tapped widget.
  final bool autofocus;

  /// Check if is possible request the focus.
  final bool canRequestFocus;

  /// Check if exclude or not the semantics.
  final bool excludeFromSemantics;

  /// Handle the mouse cursor.
  final MouseCursor? mouseCursor;

  @override
  State<TapBuilder> createState() => _TapBuilderState();
}

class _TapBuilderState extends State<TapBuilder> {
  bool _isFocused = false;
  bool _isHovered = false;
  bool _isPressed = false;

  /// This variable is used later on,
  /// although it says it is not being used.
  // ignore: unused_field
  bool _showFocus = true;

  TapState get state {
    if (widget.onTap == null) {
      return TapState.disabled;
    }
    if (_isPressed) {
      return TapState.pressed;
    }
    if (_isHovered) {
      return TapState.hovered;
    }
    if (_isFocused) {
      return TapState.focused;
    }
    return TapState.inactive;
  }

  late final Map<Type, Action<Intent>> _actionMap = <Type, Action<Intent>>{
    ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: _simulateTap),
    ButtonActivateIntent:
        CallbackAction<ButtonActivateIntent>(onInvoke: _simulateTap),
  };

  void _simulateTap([Intent? intent]) {
    widget.onTap?.call();
  }

  @override
  void initState() {
    super.initState();
    FocusManager.instance
        .addHighlightModeListener(_handleFocusHighlightModeChange);
  }

  @override
  void dispose() {
    FocusManager.instance
        .removeHighlightModeListener(_handleFocusHighlightModeChange);
    super.dispose();
  }

  void _handleFocusHighlightModeChange(FocusHighlightMode mode) {
    if (!mounted) {
      return;
    }
    setState(() {
      switch (FocusManager.instance.highlightMode) {
        case FocusHighlightMode.touch:
          _showFocus = false;
          break;
        case FocusHighlightMode.traditional:
          _showFocus = _shouldShowFocus;
          break;
      }
    });
  }

  bool get _shouldShowFocus {
    final mode = MediaQuery.maybeOf(context)?.navigationMode ??
        NavigationMode.traditional;
    switch (mode) {
      case NavigationMode.traditional:
        return enabled && _isFocused;
      case NavigationMode.directional:
        return _isFocused;
    }
  }

  void _handleFocusUpdate(bool hasFocus) {
    setState(() {
      _isFocused = hasFocus;
    });
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  void _handleTap() {
    widget.onTap?.call();
    setState(() {
      _isPressed = false;
    });
  }

  bool _isWidgetEnabled(TapBuilder widget) {
    return widget.onTap != null;
  }

  bool get enabled => _isWidgetEnabled(widget);

  void _handleMouseEnter(PointerEnterEvent event) {
    setState(() {
      _isHovered = true;
    });
  }

  void _handleMouseExit(PointerExitEvent event) {
    setState(() {
      _isHovered = false;
    });
  }

  bool get _canRequestFocus {
    final mode = MediaQuery.maybeOf(context)?.navigationMode ??
        NavigationMode.traditional;
    switch (mode) {
      case NavigationMode.traditional:
        return enabled && widget.canRequestFocus;
      case NavigationMode.directional:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    final effectiveMouseCursor = widget.mouseCursor ??
        () {
          switch (state) {
            case TapState.disabled:
              return SystemMouseCursors.forbidden;
            case TapState.pressed:
            case TapState.hovered:
              return SystemMouseCursors.click;
            case TapState.inactive:
            case TapState.focused:
              return SystemMouseCursors.basic;
          }
        }();
    return Actions(
      actions: _actionMap,
      child: Focus(
        focusNode: widget.focusNode,
        canRequestFocus: _canRequestFocus,
        onFocusChange: _handleFocusUpdate,
        autofocus: widget.autofocus,
        child: MouseRegion(
          cursor: effectiveMouseCursor,
          onEnter: _handleMouseEnter,
          onExit: _handleMouseExit,
          child: Semantics(
            onTap: widget.excludeFromSemantics || widget.onTap == null
                ? null
                : _simulateTap,
            child: GestureDetector(
              onTapDown: enabled ? _handleTapDown : null,
              onTap: enabled ? _handleTap : null,
              onTapCancel: enabled ? _handleTapCancel : null,
              behavior: HitTestBehavior.opaque,
              excludeFromSemantics: true,
              child: widget.builder(context, state),
            ),
          ),
        ),
      ),
    );
  }
}
