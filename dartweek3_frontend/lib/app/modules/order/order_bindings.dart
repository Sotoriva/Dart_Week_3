import 'package:pizza_delivery/app/modules/order/order_controller.dart';
import 'package:pizza_delivery/app/repositories/order_repository.dart';
import 'package:get/get.dart';

class OrderBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderRepository(Get.find()));
    Get.put(OrderController(Get.find()));
  }
}
