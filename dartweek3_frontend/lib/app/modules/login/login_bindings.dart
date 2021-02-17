import 'package:pizza_delivery/app/modules/login/login_controller.dart';
import 'package:pizza_delivery/app/repositories/user_repository.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(Get.find()));
    Get.put(LoginController(Get.find()));
  }
}
