// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      backdropPath: json['backdrop_path'] as String?,
      description: json['description'] as String?,
      id: json['id'] as int?,
      iso_3166_1: json['iso_3166_1'] as String?,
      iso_639_1: json['iso_639_1'] as String?,
      name: json['name'] as String?,
      page: json['page'] as int?,
      posterPath: json['poster_path'] as String?,
      public: json['public'] as bool?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int?,
      sortBy: json['sort_by'] as String?,
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'average_rating': instance.averageRating,
      'backdrop_path': instance.backdropPath,
      'description': instance.description,
      'id': instance.id,
      'iso_3166_1': instance.iso_3166_1,
      'iso_639_1': instance.iso_639_1,
      'name': instance.name,
      'page': instance.page,
      'poster_path': instance.posterPath,
      'public': instance.public,
      'results': instance.results,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'sort_by': instance.sortBy,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
