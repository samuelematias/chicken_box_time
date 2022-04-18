import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';

/// The [BackButton] widget.
class BackButton extends StatelessWidget {
  /// Creates a new instance of [BackButton].
  const BackButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  /// The button press function.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return ActionButton(
      icon: theme.icons.characters.arrowBack,
      onTap: onTap ?? () => Navigator.pop(context),
    );
  }
}
