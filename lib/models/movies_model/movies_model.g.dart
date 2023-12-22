// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesModel _$MoviesModelFromJson(Map<String, dynamic> json) => MoviesModel(
      rank: json['rank'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      bigImage: json['big_image'] as String?,
      genre:
          (json['genre'] as List<dynamic>?)?.map((e) => e as String).toList(),
      thumbnail: json['thumbnail'] as String?,
      rating: json['rating'] as String?,
      id: json['id'] as String?,
      year: json['year'] as int?,
      imdbid: json['imdbid'] as String?,
      imdbLink: json['imdb_link'] as String?,
    );

Map<String, dynamic> _$MoviesModelToJson(MoviesModel instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'big_image': instance.bigImage,
      'genre': instance.genre,
      'thumbnail': instance.thumbnail,
      'rating': instance.rating,
      'id': instance.id,
      'year': instance.year,
      'imdbid': instance.imdbid,
      'imdb_link': instance.imdbLink,
    };
