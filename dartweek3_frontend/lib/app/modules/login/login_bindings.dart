import 'package:dartweek3_frontend/app/modules/login/login_controller.dart';
import 'package:dartweek3_frontend/app/repositories/user_repository.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(Get.find()));
    Get.put(LoginController(Get.find()));
  }
}
