import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:movies_api/src/models/models.dart';

part 'movies.g.dart';

/// {@template movies}
/// A collection of movies by movie topic.
///
/// [Movies]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized
/// using [toJson] and [fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class Movies extends Equatable {
  /// {@macro movies}
  const Movies({
    this.averageRating,
    this.backdropPath,
    this.description,
    this.id,
    this.iso_3166_1,
    this.iso_639_1,
    this.name,
    this.page,
    this.posterPath,
    this.public,
    this.results,
    this.revenue,
    this.runtime,
    this.sortBy,
    this.totalPages,
    this.totalResults,
  });

  /// The average rating of this movie topic.
  @JsonKey(name: 'average_rating')
  final double? averageRating;

  /// The backdrop img.
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  /// The description of the movie topic.
  final String? description;

  /// The unique identifier of the todo.
  final int? id;

  /// The movie iso 3166 1.
  final String? iso_3166_1;

  /// The movie iso 639 1.
  final String? iso_639_1;

  /// The movie topic name.
  final String? name;

  /// The movie topic page, as pagination.
  final int? page;

  /// The poster imgae path.
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  /// Whether the movie topic is public.
  final bool? public;

  /// The movies of this movie topic.
  final List<MovieDetails>? results;

  /// The revenue of the movie topic.
  final int? revenue;

  /// The runtime of the movie topic.
  final int? runtime;

  /// How the movies are sorted.
  @JsonKey(name: 'sort_by')
  final String? sortBy;

  /// The total pages of this movie topic, as pagination.
  @JsonKey(name: 'total_pages')
  final int? totalPages;

  /// The total movies in this movie topic
  @JsonKey(name: 'total_results')
  final int? totalResults;

  /// Returns a copy of this todo with the given values updated.
  ///
  /// {@macro movies}
  Movies copyWith({
    double? averageRating,
    String? backdropPath,
    String? description,
    int? id,
    String? iso_3166_1,
    String? iso_639_1,
    String? name,
    int? page,
    String? posterPath,
    bool? public,
    List<MovieDetails>? results,
    int? revenue,
    int? runtime,
    String? sortBy,
    int? totalPages,
    int? totalResults,
  }) {
    return Movies(
      averageRating: averageRating ?? this.averageRating,
      backdropPath: backdropPath ?? this.backdropPath,
      description: description ?? this.description,
      id: id ?? this.id,
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      name: name ?? this.name,
      page: page ?? this.page,
      posterPath: posterPath ?? this.posterPath,
      public: public ?? this.public,
      results: results ?? this.results,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      sortBy: sortBy ?? this.sortBy,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  /// Deserializes the given [JsonMap] into a [Movies].
  static Movies fromJson(JsonMap json) => _$MoviesFromJson(json);

  /// Converts this [Movies] into a [JsonMap].
  JsonMap toJson() => _$MoviesToJson(this);

  @override
  List<Object?> get props => [
        averageRating,
        backdropPath,
        description,
        id,
        iso_3166_1,
        iso_639_1,
        name,
        page,
        posterPath,
        public,
        results,
        revenue,
        runtime,
        sortBy,
        totalPages,
        totalResults,
      ];
}
