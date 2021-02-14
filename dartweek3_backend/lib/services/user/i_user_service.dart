import 'package:dartweek3_backend/entities/user.dart';
import 'package:dartweek3_backend/modules/users/view_models/register_input_model.dart';
import 'package:dartweek3_backend/modules/users/view_models/user_login_model.dart';

abstract class IUserService {
  Future<void> register(RegisterInputModel inputModel);

  Future<User> login(UserLoginModel viewModel);
}
