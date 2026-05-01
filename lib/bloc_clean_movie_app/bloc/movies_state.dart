
part of 'movies_bloc.dart';

// import 'package:equatable/equatable.dart';
// import 'package:testapp/bloc_clean_movie_app/data/response/api_response.dart';
// import 'package:testapp/bloc_clean_movie_app/models/movies/movies.dart';


class MoviesState extends Equatable{
  final ApiResponse<MoviesModel> moviesList;
  const MoviesState({
    required this.moviesList,
});

  MoviesState copyWith({
    ApiResponse<MoviesModel>? moviesList,
}){
    return MoviesState(
        moviesList: moviesList ?? this.moviesList,
    );
  }

  @override
  List<Object?> get props => [moviesList];
}