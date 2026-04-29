import 'package:flutter/material.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding/view/home/home_screen.dart';

import '../../config/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: (){
              Navigator.pushNamed(
                  context,
                  RoutesName.homeScreen
              );
            },
            child: Text('Home'),
        ),
      ),
    );
  }
}
