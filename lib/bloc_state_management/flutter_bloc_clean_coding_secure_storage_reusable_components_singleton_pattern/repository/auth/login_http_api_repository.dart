
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/data/network/network_services_api.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/models/user/user_model.dart';
import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/repository/auth/login_repository.dart';
import '../../config/app_url.dart';

class LoginHttpApiRepository implements LoginRepository{

  final _api = NetworkworkServicesApi();

  @override
  Future<UserModel> loginApi(dynamic data)async{
    final response = await _api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}