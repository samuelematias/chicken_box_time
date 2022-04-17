import 'dart:typed_data';

import 'package:design_system/src/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Class responsible to make available,
/// some images from the design_system
/// and receive the app logo.
class AppImagesData extends Equatable {
  /// Creates a new instance of [AppImagesData].
  const AppImagesData({
    required this.appLogo,
    required this.chickenBoxillustration,
  });

  /// Set each image.
  factory AppImagesData.regular({required PictureProvider appLogo}) =>
      AppImagesData(
        appLogo: appLogo,
        chickenBoxillustration: const AssetImage(
          'assets/images/chicken-box-illustration.png',
          package: 'asgard_core',
        ),
      );

  /// Set each image for highContrast mode.
  factory AppImagesData.highContrast({required PictureProvider appLogo}) =>
      AppImagesData(
        appLogo: appLogo,
        chickenBoxillustration: MemoryImage(kTransparentImage),
      );

  /// The [appLogo] img.
  final PictureProvider appLogo;

  /// The [chickenBoxillustration] img.
  final ImageProvider chickenBoxillustration;

  @override
  List<Object?> get props => [
        appLogo.named('appLogo'),
        chickenBoxillustration.named('chickenBoxillustration'),
      ];

  /// Method to update the app logo.
  AppImagesData withAppLogo(PictureProvider appLogo) {
    return AppImagesData(
      appLogo: appLogo,
      chickenBoxillustration: chickenBoxillustration,
    );
  }

  /// Method to update the illustration.
  AppImagesData withBackgroundPattern(ImageProvider chickenBoxillustration) {
    return AppImagesData(
      appLogo: appLogo,
      chickenBoxillustration: chickenBoxillustration,
    );
  }
}

/// Possible variants of transparency for images.
final kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);
