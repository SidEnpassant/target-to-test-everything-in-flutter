

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/config/routes/routes_name.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/services/session_manager/session_controller.dart';

class SplashServices {



  void isLogin(BuildContext context){
    SessionController().getUserFromPreferences().then((value){
      if(SessionController().isLogin ?? false){
        Timer(const Duration(seconds: 3),
                () => Navigator.pushNamedAndRemoveUntil(  // pushNamedAndRemoveUntil because then splash will be dropped from stack and killed so that when going back should not go to splash
                context,
                RoutesName.homeScreen,
                    (route) => false
            )
        );
      }else{
        Timer(const Duration(seconds: 3),
                () => Navigator.pushNamedAndRemoveUntil(  // pushNamedAndRemoveUntil because then splash will be dropped from stack and killed so that when going back should not go to splash
                context,
                RoutesName.loginScreen,
                    (route) => false
            )
        );
      }
    }).onError((error , stackTrace){
      Timer(const Duration(seconds: 3),
              () => Navigator.pushNamedAndRemoveUntil(  // pushNamedAndRemoveUntil because then splash will be dropped from stack and killed so that when going back should not go to splash
              context,
              RoutesName.loginScreen,
                  (route) => false
          )
      );
    });

  }
}