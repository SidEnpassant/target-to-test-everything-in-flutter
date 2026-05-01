import 'package:flutter/material.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/config/components/internet_exception_widget.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/data/exceptions/app_exceptions.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/services/splash/splash_services.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/view/home/home_screen.dart';

import '../../config/components/loading_widget.dart';
import '../../config/components/round_button.dart';
import '../../config/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //     onPressed: (){
      //       throw NoInternetException(
      //         'Please check you connection'
      //       );
      //     }
      // ),

      body: SafeArea(
        child: Center(
          child: Text('Splash Screen',
          style: TextStyle(
            fontSize: 50,
          ),
          ),
          // child: Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20),
          //       child: InternetExceptionWidget(
          //         errorMessage:'We are unable to show results. \n Please check your internet\nconnection.',
          //         onPress: (){
          //
          //         },
          //       ),
          //     ),
          //     // RoundButton(
          //     //   title: 'Login',
          //     //   onPress: (){
          //     //     Navigator.pushNamed(
          //     //         context,
          //     //         RoutesName.homeScreen
          //     //     );
          //     //   },
          //     // ),
          //     // LoadingWidget(),
          //     // RoundButton(
          //     //   onPress: (){
          //     //
          //     //   },
          //     //   title: 'Home',
          //     // ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
