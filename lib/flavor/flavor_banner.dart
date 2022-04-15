import 'package:chicken_box_time/flavor/flavor.dart';
import 'package:flutter/material.dart';

/// A class to represent the [BannerConfig].
class BannerConfig {
  /// Creates a new instance of [BannerConfig].
  BannerConfig({
    required this.bannerName,
    required this.bannerColor,
  });

  /// Receive the [bannerName] as [String].
  final String bannerName;

  /// Receive the [bannerColor] as [Color].
  final Color bannerColor;
}

/// The widget responsible for creating the [FlavorBanner],
/// to indicate what flavor is the App currently.
class FlavorBanner extends StatefulWidget {
  /// Creates a new instance of [FlavorBanner].
  const FlavorBanner({
    Key? key,
    required this.child,
    this.bannerConfig,
  }) : super(key: key);

  /// Receive a [Widget] that the [FlavorBanner] will be on above of it.
  final Widget? child;

  /// Receive the [BannerConfig],
  /// that contains the name and the color of the banner.
  final BannerConfig? bannerConfig;

  @override
  State<FlavorBanner> createState() => _FlavorBannerState();
}

class _CustomBanner extends StatelessWidget {
  const _CustomBanner({
    required this.bannerConfig,
    required this.context,
  });

  final BannerConfig bannerConfig;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
          message: bannerConfig.bannerName,
          textDirection: Directionality.of(context),
          layoutDirection: Directionality.of(context),
          location: BannerLocation.topStart,
          color: bannerConfig.bannerColor,
        ),
      ),
    );
  }
}

class _FlavorBannerState extends State<FlavorBanner> {
  late BannerConfig _bannerConfig;
  final flavor = Flavor.whatIsTheFlavor;
  @override
  Widget build(BuildContext context) {
    if (flavor.isProduction()) return widget.child!;

    return Stack(
      children: <Widget>[
        widget.child!,
        _CustomBanner(bannerConfig: _bannerConfig, context: context)
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _bannerConfig = widget.bannerConfig ?? _getDefaultBanner();
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
      bannerName: flavor.getFlavorBannerName(),
      bannerColor: flavor.getFlavorBannerColor(),
    );
  }
}
