import 'package:chicken_box_time/flavor/constants.dart';

enum Environment {
  development,
  staging,
  production,
}

class Flavor {
  static late Map<String, dynamic> _config;

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

  static String get whatIsTheFlavor {
    return _config[_Config.flavor] as String;
  }
}

class _Config {
  static const flavor = 'flavor';

  static Map<String, dynamic> development = {
    flavor: flavorDevelopment,
  };

  static Map<String, dynamic> staging = {
    flavor: flavorStaging,
  };

  static Map<String, dynamic> production = {
    flavor: flavorProduction,
  };
}
