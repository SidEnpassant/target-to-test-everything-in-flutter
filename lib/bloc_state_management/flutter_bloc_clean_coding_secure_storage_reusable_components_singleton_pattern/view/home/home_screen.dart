import 'package:flutter/material.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/services/storage/local_storage.dart';

import '../../config/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: (){
                LocalStorage locaStorage = LocalStorage();
                locaStorage.clearValue('token').then((value){
                  locaStorage.clearValue('isLogin').then((value){
                    Navigator.pushNamed(context, RoutesName.loginScreen);
                  });
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      //body: ,
    );
  }
}
