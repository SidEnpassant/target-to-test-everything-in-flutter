import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc_state_management/bloc_clean_movie_app/utils/enums.dart';

import 'package:testapp/dart_oops/abstraction/main.dart';
import 'package:testapp/main.dart';
import '../../../flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/config/routes/routes_name.dart';
import '../../../flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/services/storage/local_storage.dart';
import '../../bloc/movies_bloc.dart';


class MoviesHomeScreen extends StatefulWidget {
  const MoviesHomeScreen({super.key});

  @override
  State<MoviesHomeScreen> createState() => _MoviesHomeScreenState();
}

class _MoviesHomeScreenState extends State<MoviesHomeScreen> {

  late MoviesBloc moviesBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: (){
                LocalStorage locaStorage = LocalStorage();
                locaStorage.clearValue('token').then((value){
                  locaStorage.clearValue('isLogin').then((value){
                    Navigator.pushNamed(context, RoutesName.loginScreen);
                  });
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: BlocProvider(
          create: (_) => moviesBloc..add(MoviesFetched()),
        child: BlocBuilder<MoviesBloc , MoviesState>(
            builder: (BuildContext context , state){
              switch(state.moviesList.status){
                case Status.loading:
                  return const Center(child: CircularProgressIndicator(),);
                case Status.error:
                  return Center(child: Text(state.moviesList.message.toString()),);
                case Status.completed:
                  if(state.moviesList.data == null){
                    return Text('No Data Found');
                  }
                  final moviesList = state.moviesList.data!;
                  return ListView.builder(
                    itemCount: moviesList.tvShow.length,
                      itemBuilder: (context , index){
                        final tvShow = moviesList.tvShow[index];
                        return Card(
                          child: ListTile(
                            leading: Image(image: NetworkImage(tvShow.imageThumbnailPath)),
                            title: Text(tvShow.name.toString()),// TITLE OF THE MOVIE
                            subtitle: Text(tvShow.network.toString()),// NETWORK OF THE MOVIE
                            trailing: Text(tvShow.status.toString()), // STATUS OF THE MOVIE
                          ),
                        );
                      }
                  );

                default:
                  return SizedBox();
              }
            }
        ),
      )
    );
  }
}
