import 'package:chicken_box_time/flavor/constants.dart';

/// Enum with possibles enviroments types.
enum Environment {
  /// Flavor for development enviroment.
  development,

  /// Flavor for staging enviroment.
  staging,

  /// Flavor for production enviroment.
  production,
}

/// Class responsible to set and inform the actual flavor enviroment.
class Flavor {
  static late Map<String, dynamic> _config;

  /// Method to set the actual flavor enviroment.
  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.development:
        _config = _Config.development;
        break;
      case Environment.staging:
        _config = _Config.staging;
        break;
      case Environment.production:
        _config = _Config.production;
        break;
    }
  }

  /// Method to inform the actual flavor enviroment.
  static String get whatIsTheFlavor {
    return _config[_Config.flavor] as String;
  }
}

class _Config {
  static const flavor = 'flavor';

  static Map<String, Object> development = {
    flavor: flavorDevelopment,
  };

  static Map<String, Object> staging = {
    flavor: flavorStaging,
  };

  static Map<String, Object> production = {
    flavor: flavorProduction,
  };
}
