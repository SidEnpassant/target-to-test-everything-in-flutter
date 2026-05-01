import 'package:flutter/material.dart';

class AppException implements Exception {


  final _message;
  final _prefix;
  AppException([this._message , this._prefix]);

  @override
  String toString(){
    return '$_message$_prefix'; //RETURNS THE FORMATTED ERROR MESSAGE
  }
}

class NoInternetException extends AppException{

  NoInternetException([String? message]) : super(message , 'No Internet Connection');
}

class UnAuthorisedException extends AppException{

  UnAuthorisedException([String? message]) : super(message , 'You dont have access to this ');
}

class RequestTimedOutException extends AppException{

  RequestTimedOutException([String? message]) : super(message , 'Request time out');
}


class FetchDataException extends AppException{

  FetchDataException([String? message]) : super(message , 'Data received');
}