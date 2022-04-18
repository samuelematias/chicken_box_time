import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart' as widget;

/// Enum with the avaliable Typographys scales.
enum CustomTextStyle {
  /// Represent the Typography scale for large titles.
  titleLarge,

  /// Represent the Typography scale for medium titles.
  titleMedium,

  /// Represent the Typography scale for small titles.
  titleSmall,

  /// Represent the Typography scale for medium subtitles.
  subtitleMedium,

  /// Represent the Typography scale for small subtitles.
  subtitleSmall,

  /// Represent the Typography scale for medium labels.
  labelMedium,

  /// Represent the Typography scale for small labels.
  labelSmall,
}

/// A customization of the [Text] widget.
///
/// The [Text] widget displays a string of text with single style. The string
/// might break across multiple lines or might all be displayed on the same line
/// depending on the layout constraints.
class Text extends widget.StatelessWidget {
  /// Creates a new instance of [Text].
  const Text(
    this.data, {
    widget.Key? key,
    this.color,
    required this.style,
    this.softWrap,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  /// The text to display.
  final String data;

  /// The text style to use.
  final CustomTextStyle style;

  /// The text color.
  final widget.Color? color;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// How visual overflow should be handled.
  final widget.TextOverflow? overflow;

  /// The maximum number of lines of text.
  final int? maxLines;

  @override
  widget.Widget build(widget.BuildContext context) {
    final theme = AppTheme.of(context);
    final color = this.color ?? theme.colors.font;
    final _style = () {
      switch (style) {
        case CustomTextStyle.titleLarge:
          return theme.typography.titleLarge;
        case CustomTextStyle.titleMedium:
          return theme.typography.titleMedium;
        case CustomTextStyle.titleSmall:
          return theme.typography.titleSmall;
        case CustomTextStyle.subtitleMedium:
          return theme.typography.subtitleSmall;
        case CustomTextStyle.subtitleSmall:
          return theme.typography.subtitleSmall;
        case CustomTextStyle.labelMedium:
          return theme.typography.labelMedium;
        case CustomTextStyle.labelSmall:
          return theme.typography.labelSmall;
      }
    }();
    return widget.Text(
      data,
      style: _style.copyWith(
        color: color,
      ),
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
