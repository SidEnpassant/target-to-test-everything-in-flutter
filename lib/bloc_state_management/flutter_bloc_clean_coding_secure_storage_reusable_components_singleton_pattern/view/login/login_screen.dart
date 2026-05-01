import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/bloc/login_bloc.dart' hide LoginButton;
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/models/user/user_model.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/repository/auth/login_repository.dart';
import 'package:testapp/main.dart';
import 'widgets/widgets.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBlocs;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBlocs = LoginBloc(loginRepository: getIt());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        backgroundColor: Colors.black,
      ),
      body: BlocProvider(
          create: (_) => _loginBlocs,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EmailInputWidget(emailFocusNode: emailFocusNode,),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordInputWidget(passwordFocusNode: passwordFocusNode,),
                    const SizedBox(
                      height: 50,
                    ),
                    LoginButton(formKey: _formKey,),
                  ],
                )
            ),
          ),
      )
    );
  }
}
