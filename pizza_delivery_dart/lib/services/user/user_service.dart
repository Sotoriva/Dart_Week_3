import 'package:pizza_delivery/application/helpers/cripty_helper.dart';
import 'package:pizza_delivery/entities/user.dart';
import 'package:pizza_delivery/modules/users/view_models/register_input_model.dart';
import 'package:pizza_delivery/modules/users/view_models/user_login_model.dart';
import 'package:pizza_delivery/repositories/user/i_user_repository.dart';
import 'package:pizza_delivery/services/user/i_user_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IUserService)
class UserService implements IUserService {
  final IUserRepository _respository;

  UserService(
    this._respository,
  );

  @override
  Future<void> register(RegisterInputModel inputModel) async {
    final passwordCripty = CriptyHelper.generateSHA256Hash(inputModel.password);
    inputModel.password = passwordCripty;
    await _respository.saveUser(inputModel);
  }

  @override
  Future<User> login(UserLoginModel viewModel) async {
    final passwordCripty = CriptyHelper.generateSHA256Hash(viewModel.password);
    viewModel.password = passwordCripty;
    return await _respository.login(viewModel);
  }
}
