import 'package:pizza_delivery/app/modules/register/register_controller.dart';
import 'package:pizza_delivery/app/repositories/user_repository.dart';
import 'package:get/get.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(Get.find()));
    Get.put(RegisterController(Get.find()));
  }
}
