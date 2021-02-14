import 'dart:convert';

import 'package:dartweek3_frontend/app/models/order_item_model.dart';

class OrderModel {
  OrderModel({
    this.id,
    this.paymentType,
    this.address,
    this.items,
  });

  int id;
  String paymentType;
  String address;
  List<OrderItemModel> items;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'paymentType': paymentType,
      'address': address,
      'items': items?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OrderModel(
      id: map['id'] ?? 0,
      paymentType: map['paymentType'] ?? '',
      address: map['address'] ?? '',
      items: List<OrderItemModel>.from(map['items']
              ?.map((x) => OrderItemModel.fromMap(x) ?? OrderItemModel())) ??
          const [], //TODO: fazer percorrer a lista
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
