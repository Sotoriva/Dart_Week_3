import 'package:dartweek3_frontend/app/helpers/rest_client.dart';
import 'package:dartweek3_frontend/app/models/user_model.dart';
import 'package:dartweek3_frontend/app/view_models/register_user_input_model.dart';
// import 'package:get/get.dart';
// = Get.find()

class UserRepository {
  final RestClient restClient;

  UserRepository(this.restClient);

  Future<UserModel> login(String email, String password) async {
    final response = await restClient.post(
      '/user/auth',
      {'email': email, 'password': password},
      decoder: (resp) {
        if (resp != '') {
          return UserModel.fromMap(resp);
        }
      },
    );

    if (response.hasError) {
      String message = 'Erro ao autenticar o usuário!';

      if (response.statusCode == 403) {
        message = 'Usuário ou senha inválidos!';
      }

      throw RestClientException(message);
    }
    return response.body;
  }

  Future<void> saveUser(RegisterUserInputModel model) async {
    final response = await restClient.post('/user/', {
      'name': model.name,
      'email': model.email,
      'password': model.password,
    });

    if (response.hasError) {
      throw RestClientException('Erro ao registrar usuário!');
    }
  }
}
