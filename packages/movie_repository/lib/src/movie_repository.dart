import 'dart:async';

import 'package:movies_api/movies_api.dart';

/// Exception thrown when getMovies fails.
class MovieFailure implements Exception {}

/// {@template movies_repository}
/// A repository that handles movie related requests.
/// {@endtemplate}
class MovieRepository {
  /// {@macro movies_repository}
  MovieRepository({
    MovieApiClient? movieApiClient,
  }) : _movieApiClient = movieApiClient ?? MovieApiClient();

  final MovieApiClient _movieApiClient;

  /// Provides a [MovieDetails] of all movies.
  Future<MovieDetails> getMovies() async {
    final movieResponse = await _movieApiClient.getMovies();
    return movieResponse;
  }
}
