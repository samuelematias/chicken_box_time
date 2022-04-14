import 'package:chicken_box_time/flavor/flavor.dart';
import 'package:flutter/material.dart';

class FlavorBanner extends StatefulWidget {
  final Widget? child;
  final BannerConfig? bannerConfig;

  const FlavorBanner({
    Key? key,
    required this.child,
    this.bannerConfig,
  }) : super(key: key);

  @override
  _FlavorBannerState createState() => _FlavorBannerState();
}

class _FlavorBannerState extends State<FlavorBanner> {
  late BannerConfig _bannerConfig;
  final flavor = Flavor.whatIsTheFlavor;
  @override
  void initState() {
    super.initState();

    _bannerConfig = widget.bannerConfig ?? _getDefaultBanner();
  }

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

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
      bannerName: flavor.getFlavorBannerName(),
      bannerColor: flavor.getFlavorBannerColor(),
    );
  }
}

class _CustomBanner extends StatelessWidget {
  final BannerConfig bannerConfig;
  final BuildContext context;

  const _CustomBanner({
    required this.bannerConfig,
    required this.context,
  });

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

class BannerConfig {
  final String bannerName;
  final Color bannerColor;

  BannerConfig({
    required this.bannerName,
    required this.bannerColor,
  });
}
