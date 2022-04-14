import 'package:flutter/material.dart';

extension FlavorExtension on String {
  Color getFlavorColor() {
    switch (this) {
      case 'development':
        return const Color(0xFF3096F3);
      case 'staging':
        return const Color(0xFFF3993F);
      case 'production':
        return const Color(0xFF6B45E8);
      default:
        return Colors.grey[600]!;
    }
  }

  String getFlavorName() {
    switch (this) {
      case 'development':
        return 'Development';
      case 'staging':
        return 'Staging';
      case 'production':
        return 'Production';
      default:
        return 'Unknown Flavor';
    }
  }
}
