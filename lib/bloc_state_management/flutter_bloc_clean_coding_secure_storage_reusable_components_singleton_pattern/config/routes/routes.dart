import 'package:flutter/material.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/config/routes/routes_name.dart';

import '../../../../bloc_clean_movie_app/view/home/movies_home_screen.dart';
import '../../view/view.dart';


class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen :
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.loginScreen :
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.homeScreen :
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.moviesHomeScreen :
        return MaterialPageRoute(builder: (context) => const MoviesHomeScreen());
      default :
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(
              child: Text(
                'No Route Generated',
              ),
            ),
          );
        });
    }
  }
}