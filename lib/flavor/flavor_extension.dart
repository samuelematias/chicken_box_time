import 'package:chicken_box_time/flavor/constants.dart';
import 'package:chicken_box_time/utils/utils.dart';
import 'package:flutter/material.dart';

/// A collection of [String] class/type extensions, focus on Flavor scope.
extension FlavorExtension on String {
  /// Extension to get the Flavor banner color
  /// by the actual Flavor environment.
  Color getFlavorBannerColor() {
    switch (this) {
      case flavorDevelopment:
        return Colors.red[900]!;
      case flavorStaging:
        return Colors.red[900]!;
      case flavorProduction:
        return Colors.red[900]!;
      default:
        return Colors.grey[600]!;
    }
  }

  /// Extension to get the Flavor banner name
  /// by the actual Flavor environment.
  String getFlavorBannerName() {
    switch (this) {
      case flavorDevelopment:
        return 'DEV';
      case flavorStaging:
        return 'STAGING';
      case flavorProduction:
        return 'PROD';
      default:
        return 'Unknown Flavor';
    }
  }

  /// Extension to get the Flavor color
  /// by the actual Flavor environment.
  Color getFlavorColor() {
    switch (this) {
      case flavorDevelopment:
        return const Color(0xFF3096F3);
      case flavorStaging:
        return const Color(0xFFF3993F);
      case flavorProduction:
        return const Color(0xFF6B45E8);
      default:
        return Colors.grey[600]!;
    }
  }

  /// Extension to get the Flavor name
  /// by the actual Flavor environment.
  String getFlavorName() {
    switch (this) {
      case flavorDevelopment:
        return flavorDevelopment.capitalize();
      case flavorStaging:
        return flavorStaging.capitalize();
      case flavorProduction:
        return flavorProduction.capitalize();
      default:
        return 'Unknown Flavor';
    }
  }

  /// Check if the actual Flavor environment is the Development.
  bool isDevelopment() => toLowerCase() == flavorDevelopment;

  /// Check if the actual Flavor environment is the Production.
  bool isProduction() => toLowerCase() == flavorProduction;

  /// Check if the actual Flavor environment is the Staging.
  bool isStaging() => toLowerCase() == flavorStaging;
}
