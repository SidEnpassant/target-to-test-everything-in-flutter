import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/bloc/login_bloc.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/utils/enums.dart';

import '../../../config/routes/routes_name.dart';
import '../../../utils/flush_bar_helper.dart';

class LoginButton extends StatelessWidget {
  final formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (current , previous) => current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if(state.postApiStatus == PostApiStatus.error){
          FlushBarHelper.flushBarErrorMessage(state.message.toString(), context);
          // ScaffoldMessenger.of(context)
          //     ..hideCurrentSnackBar()
          //     ..showSnackBar(
          //       SnackBar(content: Text(state.message.toString()))
          //  );
        }
        if(state.postApiStatus == PostApiStatus.success){
          Navigator.pushNamed(context , RoutesName.homeScreen);
          FlushBarHelper.flushBarSuccessMessage(state.message.toString(), context);
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(
          //       SnackBar(content: Text(state.message.toString()))
          //  );
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (current , previous) => current.postApiStatus != previous.postApiStatus,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginApi());
              }
            },
            child: state.postApiStatus == PostApiStatus.loading ? CircularProgressIndicator() : const Text('Login'),
          );
        },
      ),
    );
  }
}
