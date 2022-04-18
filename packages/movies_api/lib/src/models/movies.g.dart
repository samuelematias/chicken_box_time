// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      averageRating: (json['averageRating'] as num).toDouble(),
      backdropPath: json['backdropPath'] as String,
      description: json['description'] as String,
      id: json['id'] as int,
      iso_3166_1: json['iso_3166_1'] as String,
      iso_639_1: json['iso_639_1'] as String,
      name: json['name'] as String,
      page: json['page'] as int,
      posterPath: json['posterPath'] as String,
      public: json['public'] as bool,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      revenue: json['revenue'] as int,
      runtime: json['runtime'] as int,
      sortBy: json['sortBy'] as String,
      totalPages: json['totalPages'] as int,
      totalResults: json['totalResults'] as int,
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'averageRating': instance.averageRating,
      'backdropPath': instance.backdropPath,
      'description': instance.description,
      'id': instance.id,
      'iso_3166_1': instance.iso_3166_1,
      'iso_639_1': instance.iso_639_1,
      'name': instance.name,
      'page': instance.page,
      'posterPath': instance.posterPath,
      'public': instance.public,
      'results': instance.results,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'sortBy': instance.sortBy,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
