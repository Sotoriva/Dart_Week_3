import 'package:pizza_delivery/app/modules/shoppingCard/shopping_card_controller.dart';
import 'package:pizza_delivery/app/modules/shoppingCard/widgets/shopping_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ShoppingCardItems extends GetView<ShoppingCardController> {
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(
      name: 'R\$',
      locale: 'pt_br',
      decimalDigits: 2,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Pedido',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 10),
        ...controller.flavoursSelected.map((item) => ShoppingCardItem(item)).toList(),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total:'),
              Text(formatter.format(controller.totalPrice)),
            ],
          ),
        ),
      ],
    );
  }
}
