import 'package:chicken_box_time/app/app.dart';
import 'package:chicken_box_time/flavor/flavor.dart';
import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flavor.setEnvironment(Environment.development);
  runApp(const App());
}
