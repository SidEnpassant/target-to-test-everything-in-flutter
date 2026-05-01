part of 'login_bloc.dart';


class LoginStates extends Equatable{
  final String email;
  final String password;
  final PostApiStatus postApiStatus;
  final String message;

  const LoginStates({
   this.email = '', this.password = '',this.postApiStatus = PostApiStatus.initial,
    this.message = '',
  });

  LoginStates copyWith({  /// NEW INSTANCE OF LoginState with copyWith
    String? email,
    String? password,
    PostApiStatus? postApiStatus,
    String? message,
}){
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email , password , postApiStatus , message];
}