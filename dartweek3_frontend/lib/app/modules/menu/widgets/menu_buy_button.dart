import 'package:pizza_delivery/app/modules/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MenuBuyButton extends GetView<MenuController> {
  final formatter = NumberFormat('##0.00', 'pt_br');
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Row(
        children: [
          SizedBox(
            width: Get.mediaQuery.size.width * .5,
            child: Obx(
              () => Text(
                'Total R\$ ${formatter.format(controller.totalValue)}',
                style: TextStyle(
                  fontSize: 18,
                  color: controller.flavoursSelected.isEmpty ? Colors.grey : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => TextButton(
                onPressed: () => controller.goToShoppingCard(),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    controller.flavoursSelected.isEmpty ? Colors.grey[200] : Colors.red,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Fechar Pedido',
                    style: TextStyle(
                      fontSize: 18,
                      color: controller.flavoursSelected.isEmpty ? Colors.grey : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
