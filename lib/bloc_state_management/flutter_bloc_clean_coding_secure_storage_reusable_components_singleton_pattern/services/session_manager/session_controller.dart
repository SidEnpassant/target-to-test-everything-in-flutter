


import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/models/user/user_model.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/services/storage/local_storage.dart';

class SessionController{

  static final SessionController _session = SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();

  bool? isLogin;
  SessionController._internal(){ // PROTECT FROM GETTING MADE MULTIPLE INSTANCES

    isLogin = false;
  }

  factory SessionController(){
    return _session;
  }

  Future<void> saveUserInPreference(dynamic user) async{
    localStorage.setValue('token', jsonEncode(user));
    //Storing value to check login
    localStorage.setValue('isLogin', 'true');
  }


  Future<void> getUserFromPreferences() async{
    try{
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');

      if(userData.isNotEmpty){
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    }catch(e){
      debugPrint(e.toString());
    }
  }
}