import 'package:dartweek3_frontend/app/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryPanel extends StatelessWidget {
  final OrderModel order;

  HistoryPanel(this.order, {Key key}) : super(key: key);

  final formatter =
      NumberFormat.currency(name: 'R\$', locale: 'pt_br', decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Pedido ${order.id}'),
      children: [
        Divider(),
        ...order.items.map((o) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(o.item.name),
                Text(formatter.format(o.item.price)),
              ],
            ),
          );
        }).toList(),
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total'),
              Text(formatter.format(_calculateTotalOrder())),
            ],
          ),
        ),
      ],
    );
  }

  double _calculateTotalOrder() =>
      order.items.fold(0, (total, o) => total += o.item.price);
}
