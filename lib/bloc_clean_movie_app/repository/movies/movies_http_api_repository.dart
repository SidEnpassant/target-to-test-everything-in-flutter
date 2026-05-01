
import 'package:testapp/bloc_clean_movie_app/models/movies/movies.dart';
import 'package:testapp/bloc_clean_movie_app/repository/movies/movies_repository.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/config/app_url.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/data/network/network_services_api.dart';

class MoviesHttpApiRepository implements MoviesRepository{
  final _apiServices = NetworkworkServicesApi();


  @override
  Future<MoviesModel> fetchMoviesList() async{
    final response = await _apiServices.getApi(AppUrl.popularMoviesListEndpoint);
    return MoviesModel.fromJson(response);
  }
}