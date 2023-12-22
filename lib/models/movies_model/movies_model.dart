import 'package:json_annotation/json_annotation.dart';

part 'movies_model.g.dart';

@JsonSerializable()
class MoviesModel {
	int? rank;
	String? title;
	String? description;
	String? image;
	@JsonKey(name: 'big_image') 
	String? bigImage;
	List<String>? genre;
	String? thumbnail;
	String? rating;
	String? id;
	int? year;
	String? imdbid;
	@JsonKey(name: 'imdb_link') 
	String? imdbLink;

	MoviesModel({
		this.rank, 
		this.title, 
		this.description, 
		this.image, 
		this.bigImage, 
		this.genre, 
		this.thumbnail, 
		this.rating, 
		this.id, 
		this.year, 
		this.imdbid, 
		this.imdbLink, 
	});

	factory MoviesModel.fromJson(Map<String, dynamic> json) {
		return _$MoviesModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$MoviesModelToJson(this);
}
