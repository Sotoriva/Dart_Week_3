import 'package:pizza_delivery/app/models/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShoppingCardItem extends StatelessWidget {
  final MenuItemModel item;

  const ShoppingCardItem(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(
      name: 'R\$',
      locale: 'pt_br',
      decimalDigits: 2,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.name),
          Text(formatter.format(item.price)),
        ],
      ),
    );
  }
}
