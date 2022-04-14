import 'package:flutter/material.dart';
import 'package:chicken_box_time/flavor/constants.dart';
import 'package:chicken_box_time/utils/utils.dart';

extension FlavorExtension on String {
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

  bool isDevelopment() => toLowerCase() == flavorDevelopment;
  bool isStaging() => toLowerCase() == flavorStaging;
  bool isProduction() => toLowerCase() == flavorProduction;
}
