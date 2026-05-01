



import 'package:testapp/bloc_clean_movie_app/models/movies/movies.dart';

abstract class MoviesRepository {
  Future<MoviesModel> fetchMoviesList();
}