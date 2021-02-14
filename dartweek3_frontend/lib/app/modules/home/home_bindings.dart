import 'package:dartweek3_frontend/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
