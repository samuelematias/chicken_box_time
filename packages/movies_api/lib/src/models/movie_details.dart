import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:movies_api/src/models/models.dart';

part 'movie_details.g.dart';

/// {@template movie_details}
/// A single movie details item.
///
/// [MovieDetails]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized
/// using [toJson] and [fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class MovieDetails extends Equatable {
  /// {@macro movie_details}
  const MovieDetails({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.mediaType,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  /// Whether the movie is for adults only.
  final bool? adult;

  /// The backdrop img.
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  /// The genre ids.
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  /// The unique identifier of the todo.
  final int? id;

  /// The media type, in this case movie type.
  @JsonKey(name: 'media_type')
  final String? mediaType;

  /// The original languange of the movie.
  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  /// The original title of the movie.
  @JsonKey(name: 'original_title')
  final String? originalTitle;

  /// The movie introduction.
  final String? overview;

  /// The filme popularity.
  final double? popularity;

  /// The poster imgae path.
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  /// The release date of the movie.
  @JsonKey(name: 'release_date')
  final String? releaseDate;

  /// The title of the movie.
  final String? title;

  /// Whether the movie has video.
  final bool? video;

  /// The vote average of the movie.
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  /// The vote count of the movie.
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  /// Returns a copy of this todo with the given values updated.
  ///
  /// {@macro movie_details}
  MovieDetails copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? mediaType,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieDetails(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      mediaType: mediaType ?? this.mediaType,
      originalLanguage: mediaType ?? this.mediaType,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  /// Deserializes the given [JsonMap] into a [MovieDetails].
  static MovieDetails fromJson(JsonMap json) => _$MovieDetailsFromJson(json);

  /// Converts this [MovieDetails] into a [JsonMap].
  JsonMap toJson() => _$MovieDetailsToJson(this);

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        mediaType,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
