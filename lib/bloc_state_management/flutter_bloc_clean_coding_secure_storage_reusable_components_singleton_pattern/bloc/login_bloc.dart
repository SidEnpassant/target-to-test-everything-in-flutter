import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/repository/auth/login_repository.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/utils/enums.dart';

import '../services/session_manager/session_controller.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents , LoginStates>{

  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginStates()){  // Super because passing login initial state
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event , Emitter<LoginStates> emit){
    emit(
      state.copyWith(
        email: event.email,
      )
    );
  }

  void _onPasswordChanged(PasswordChanged event , Emitter<LoginStates> emit){
    emit(
        state.copyWith(
          password: event.password,
        )
    );
  }

  void _loginApi(LoginApi event , Emitter<LoginStates> emit)async{
    Map data = {
      "email": state.email,
      "password": state.password,
    };
    emit(
        state.copyWith(
          postApiStatus: PostApiStatus.loading,
        )
    );
    await loginRepository.loginApi(data).then((value)async{
      if(value.error.isNotEmpty){
        emit(
            state.copyWith(
              message: value.toString(),
              postApiStatus: PostApiStatus.error,
            ),
        );
      }else{
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreferences();
        emit(
            state.copyWith(
              message: 'Login Successful',
              postApiStatus: PostApiStatus.success,
            )
        );
      }
    }).onError((error , stackTrace){
      emit(
          state.copyWith(
              message: error.toString(),
                  postApiStatus: PostApiStatus.error
          )
      );
    });

  }
}