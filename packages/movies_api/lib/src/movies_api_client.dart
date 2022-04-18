import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_api/movies_api.dart';

/// Exception thrown when getWeather fails.
class MoviesRequestFailure implements Exception {}

/// Exception thrown when a movie is searched and not found.
class MoviesNotFoundFailure implements Exception {}

/// {@template movie_api_client}
/// Dart API Client which wraps the [MovieApi API](https://www.themoviedb.org/documentation/api).
/// {@endtemplate}
class MovieApiClient {
  /// {@macro meta_weather_api_client}
  MovieApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'https://api.themoviedb.org/4/';
  final http.Client _httpClient;

  /// Fetches [Movies].
  Future<MovieDetails> getMovies() async {
    const apiTokenv4 = 'eyJhbGciOiJIUzI1NiJ9.'
        'eyJhdWQiOiJlODBkNTZjM2NmNzk0'
        'ZWJmN2Q5NmVhYjdkMDkzNzE4'
        'MiIsInN1YiI6IjYyNTIx'
        'ZWU3NjdlMGY3'
        'MjcyMTYxNjMzYSIsInNjb3BlcyI6Wy'
        'JhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.'
        'hvgT80_nk18JAr8PEpZ7YLBrJa7jJpRdOFgnEqyViqU';
    const movieListUrl = 'list/1?page=1';
    final moviesRequest = Uri.https(_baseUrl, movieListUrl);
    final moviesResponse = await _httpClient.get(
      moviesRequest,
      headers: {
        'content-type': 'application/json;charset=utf-8',
        'Authorization': 'Bearer $apiTokenv4',
      },
    );

    if (moviesResponse.statusCode != 200) {
      throw MoviesRequestFailure();
    }

    final bodyJson = jsonDecode(moviesResponse.body) as JsonMap;

    if (bodyJson.isEmpty) {
      throw MoviesNotFoundFailure();
    }

    final moviesJson = bodyJson['results'] as List<MovieDetails>;

    if (moviesJson.isEmpty) {
      throw MoviesNotFoundFailure();
    }

    return MovieDetails.fromJson(moviesJson as JsonMap);
  }
}
