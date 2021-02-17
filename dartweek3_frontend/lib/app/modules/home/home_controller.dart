import 'package:pizza_delivery/app/modules/menu/menu_controller.dart';
import 'package:pizza_delivery/app/modules/menu/menu_page.dart';
import 'package:pizza_delivery/app/repositories/menu_repository.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeController extends GetxController {
  Future<void> openMenu(String pizzaSize) async {
    Get.put(MenuRepository(Get.find()));
    Get.put(MenuController(Get.find()));
    await showBarModalBottomSheet(
      context: Get.context,
      builder: (context) {
        return MenuPage(pizzaSize);
      },
    );
    Get.delete<MenuController>();
    Get.delete<MenuRepository>();
  }
}
