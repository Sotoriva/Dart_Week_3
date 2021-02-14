import 'package:dartweek3_frontend/app/components/botao.dart';
import 'package:dartweek3_frontend/app/modules/shoppingCard/shopping_card_controller.dart';
import 'package:dartweek3_frontend/app/modules/shoppingCard/widgets/shopping_card_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Sacola',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Get.back(),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constructor) {
            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: constructor.maxHeight,
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Nome'),
                      subtitle: Text(controller.userName),
                    ),
                    Divider(),
                    ShoppingCardItems(),
                    Divider(),
                    ListTile(
                      title: Text('Endereço de entrega'),
                      subtitle: Obx(() => Text(controller.address)),
                      trailing: TextButton(
                        child: Text(
                          'Alterar',
                          style: TextStyle(color: Get.theme.primaryColor),
                        ),
                        onPressed: () => controller.changeAddress(),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Forma de pagamento'),
                      subtitle: Obx(() => Text(controller.paymentType)),
                      trailing: TextButton(
                        child: Text(
                          'Alterar',
                          style: TextStyle(color: Get.theme.primaryColor),
                        ),
                        onPressed: () => controller.changePaymentType(),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: SizedBox.shrink(),
                    ),
                    Botao(
                      label: 'Finalizar Pedido',
                      height: 50,
                      width: Get.mediaQuery.size.width * .9,
                      buttonColor: Get.theme.primaryColor,
                      labelSize: 18,
                      labelColor: Colors.white,
                      onPressed: () => controller.checkout(),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
