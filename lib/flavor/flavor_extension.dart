import 'package:flutter/material.dart';

extension FlavorExtension on String {
  Color getFlavorColor() {
    switch (this) {
      case 'development':
        return Colors.yellow[800]!;
      case 'staging':
        return Colors.grey[600]!;
      case 'production':
        return Colors.green[600]!;
      default:
        return Colors.blue[600]!;
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
