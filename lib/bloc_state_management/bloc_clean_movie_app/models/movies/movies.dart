
import 'package:freezed_annotation/freezed_annotation.dart';
part 'movies.g.dart';
part 'movies.freezed.dart';
@freezed
class MoviesModel with _$MoviesModel{
  
  factory MoviesModel({
    @Default(0) @JsonKey(name: 'total') int total, //Total number of movies
    @Default(0) int page , //Current page number
    @Default(0) int pages, //Total number of pages
    @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShow,

}) = _MoviesModel; // Constructor

factory MoviesModel.fromJson(Map<String , dynamic> json) => _$MoviesModelFromJson(json);

  @override
  // TODO: implement page
  int get page => throw UnimplementedError();

  @override
  // TODO: implement pages
  int get pages => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement total
  int get total => throw UnimplementedError();

  @override
  // TODO: implement tvShow
  List<TvShows> get tvShow => throw UnimplementedError();



}


@freezed
class TvShows with _$TvShows{

  factory TvShows({
    @JsonKey(name: 'name')  @Default('') String name, //Name of the show
    @JsonKey(name: 'permalink')  @Default('') String permaLink, //Permalink of the show
    @JsonKey(name: 'start_date')  @Default('') String startDate, //start date of the show
    @JsonKey(name: 'network')  @Default('') String network, //network of the show
    @JsonKey(name: 'image_thumbnail_path')  @Default('') String imageThumbnailPath, //Image thumbnail path
    @JsonKey(name: 'status')  @Default('') String status, //status of the show

  }) = _TvShows; // Constructor

  factory TvShows.fromJson(Map<String , dynamic> json) => _$TvShowsFromJson(json);

  @override
  // TODO: implement imageThumbnailPath
  String get imageThumbnailPath => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement network
  String get network => throw UnimplementedError();

  @override
  // TODO: implement permaLink
  String get permaLink => throw UnimplementedError();

  @override
  // TODO: implement startDate
  String get startDate => throw UnimplementedError();

  @override
  // TODO: implement status
  String get status => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }




}