import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/provider_state_management/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                authProvider.login(
                  email.text.toString(), 
                  password.text.toString()
                  );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: authProvider.loading? CircularProgressIndicator(color: Colors.white,): Text('Login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}