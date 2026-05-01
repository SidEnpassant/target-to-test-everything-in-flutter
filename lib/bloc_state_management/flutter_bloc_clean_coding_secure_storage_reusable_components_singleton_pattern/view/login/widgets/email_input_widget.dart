import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/bloc/login_bloc.dart';
import 'package:testapp/dart_oops/mixin/main.dart';

import '../../../utils/validations.dart';

class EmailInputWidget extends StatelessWidget {

  final FocusNode emailFocusNode ;
  const EmailInputWidget({super.key , required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc , LoginStates>(
        buildWhen: (current , previous) => current.email != previous.email,
        builder: (context , state){
          return TextFormField(
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder()
            ),
            onChanged: (value){
              context.read<LoginBloc>().add(EmailChanged(email: value));
            },
            validator: (value){
              if(value!.isEmpty){
                return 'Enter Email';
              }
              if(!Validations.emailValidator(value)){
                return 'Email is not correct';
              }
              return null;
            },
            onFieldSubmitted: (value){

            },
          );
        }
    );
  }
}
