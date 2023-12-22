import 'package:json_annotation/json_annotation.dart';

part 'series_list_model.g.dart';

@JsonSerializable()
class SeriesListModel {
	int? rank;
	String? title;
	String? description;
	String? image;
	@JsonKey(name: 'big_image') 
	String? bigImage;
	List<String>? genre;
	String? thumbnail;
	double? rating;
	String? id;
	String? year;
	String? imdbid;
	@JsonKey(name: 'imdb_link') 
	String? imdbLink;

	SeriesListModel({
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

	factory SeriesListModel.fromJson(Map<String, dynamic> json) {
		return _$SeriesListModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SeriesListModelToJson(this);
}
