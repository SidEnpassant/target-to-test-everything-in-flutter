

import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/models/user/user_model.dart';


abstract class LoginRepository{

  @override
  Future<UserModel> loginApi(dynamic data);
}