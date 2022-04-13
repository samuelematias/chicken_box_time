import 'package:chicken_box_time/flavor/flavor.dart';
import 'package:chicken_box_time/main.dart';
import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flavor.setEnvironment(Environment.production);
  runApp(const MyApp());
}
