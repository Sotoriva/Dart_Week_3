import 'package:pizza_delivery/app/modules/menu/menu_controller.dart';
import 'package:pizza_delivery/app/modules/menu/widgets/menu_group.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuContent extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Obx(
        () => ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (_, index) {
            return MenuGroup(controller.menu[index]);
          },
        ),
      ),
    );
  }
}
