import 'package:pizza_delivery/app/helpers/rest_client.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
  }
}
