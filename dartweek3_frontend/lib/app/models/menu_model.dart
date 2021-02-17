import 'dart:convert';

import 'package:pizza_delivery/app/models/menu_item_model.dart';

class MenuModel {
  final int id;
  final String name;
  final List<MenuItemModel> items;

  MenuModel({this.id, this.name, this.items});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'items': items?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MenuModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      items: List<MenuItemModel>.from(map['items']?.map((x) => MenuItemModel.fromMap(x) ?? MenuItemModel())) ?? const [], //TODO: fazer percorrer a lista
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) => MenuModel.fromMap(json.decode(source));
}
