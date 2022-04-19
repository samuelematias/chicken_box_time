import 'package:chicken_box_time/app/app.dart';
import 'package:chicken_box_time/bootstrap.dart';
import 'package:chicken_box_time/flavor/flavor.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_repository/movie_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flavor.setEnvironment(Environment.staging);

  final _movieRepository = MovieRepository();

  bootstrap(() {
    return App(
      movieRepository: _movieRepository,
    );
  });
}
