import 'package:pizza_delivery/app/modules/menu/menu_controller.dart';
import 'package:pizza_delivery/app/modules/menu/widgets/menu_buy_button.dart';
import 'package:pizza_delivery/app/modules/menu/widgets/menu_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends GetView<MenuController> {
  final String pizzaSize;

  MenuPage(this.pizzaSize);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pizzaSize,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[100],
              width: double.infinity,
              child: Obx(
                () => Text(
                  'Total de pizza selecionadas: ${controller.flavoursSelected.length}',
                  style: Get.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(child: MenuContent()),
            Container(child: MenuBuyButton()),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
