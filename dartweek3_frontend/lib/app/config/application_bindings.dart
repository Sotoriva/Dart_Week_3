import 'package:dartweek3_frontend/app/helpers/rest_client.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
  }
}
