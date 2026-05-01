
import 'package:freezed_annotation/freezed_annotation.dart';
part 'movies.freezed.dart';
part 'movies.g.dart';
@freezed
class MoviesModel with _$MoviesModel{
  
  factory MoviesModel({
    @Default('') @JsonKey(name: 'total') String total, //Total number of movies
    @Default(0) int page , //Current page number
    @Default(0) int pages, //Total number of pages
    @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShow,

}) = _MoviesModel; // Constructor

factory MoviesModel.fromJson(Map<String , dynamic> json) => _$MoviesModelFromJson(json);

  @override
  int get page => throw UnimplementedError();

  @override
  int get pages => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  String get total => throw UnimplementedError();

  @override
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
  String get imageThumbnailPath => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  @override
  String get network => throw UnimplementedError();

  @override
  String get permaLink => throw UnimplementedError();

  @override
  String get startDate => throw UnimplementedError();

  @override
  String get status => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}