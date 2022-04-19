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

  static const _baseUrl = 'api.themoviedb.org';
  final http.Client _httpClient;

  /// Fetches [Movies].
  Future<List<MovieDetails>> getMovies() async {
    const apiTokenv4 = 'eyJhbGciOiJIUzI1NiJ9.'
        'eyJhdWQiOiJlODBkNTZjM2NmNzk0'
        'ZWJmN2Q5NmVhYjdkMDkzNzE4'
        'MiIsInN1YiI6IjYyNTIx'
        'ZWU3NjdlMGY3'
        'MjcyMTYxNjMzYSIsInNjb3BlcyI6Wy'
        'JhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.'
        'hvgT80_nk18JAr8PEpZ7YLBrJa7jJpRdOFgnEqyViqU';
    const movieListUrl = '/4/list/1';
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

    // Necessary "ignore this rule experimental"
    //for hacking the dynamic type.
    // ignore: cast_nullable_to_non_nullable
    final moviesListJson = (bodyJson['results'] as List<Object?>)
        // Necessary "ignore this rule experimental"
        // for hacking the dynamic type.
        // ignore: cast_nullable_to_non_nullable
        .map((json) => json as JsonMap);

    if (moviesListJson.isEmpty) {
      throw MoviesNotFoundFailure();
    }
    return moviesListJson
        .map(
          MovieDetails.fromJson,
        )
        .toList();
  }
}
