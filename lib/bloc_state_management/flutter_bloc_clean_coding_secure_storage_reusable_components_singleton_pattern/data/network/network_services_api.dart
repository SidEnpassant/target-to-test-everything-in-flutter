



import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/data/exceptions/app_exceptions.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;


class NetworkworkServicesApi implements BaseApiServices{
  @override
  Future<dynamic> getApi(String url) async{
    dynamic jsonResponse;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
      if(response.statusCode == 200){

      }
    }on SocketException{
      throw NoInternetException();
    }on FetchDataException{
      'Timeout , try again';
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> deleteApi(String url) async{
    dynamic jsonResponse;
    try{
      final response = await http.delete(Uri.parse('')).timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
      if(response.statusCode == 200){

      }
    }on SocketException{
      throw NoInternetException();
    }on FetchDataException{
      'Timeout , try again';
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, var data) async{
    dynamic jsonResponse;
    if(kDebugMode){
      print(url);
    print(data);
    }
    try{
      final response = await http.post(Uri.parse(''),
      body: data
      ).timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
      if(response.statusCode == 200){

      }
    }on SocketException{
      throw NoInternetException();
    }on FetchDataException{
      'Timeout , try again';
    }
    return jsonResponse;

  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic jsonResponse = jsonEncode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonEncode(response.body);
        return jsonResponse;
      case 401:
        // dynamic jsonResponse = jsonEncode(response.body);
        // return jsonResponse;
        throw UnAuthorisedException();
      case 500:
        throw FetchDataException('Error communicating with server ' + response.statusCode.toString());
      default:
        throw UnAuthorisedException();
    }
  }

}