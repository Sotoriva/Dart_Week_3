import 'dart:convert';

import 'package:dartweek3_backend/modules/order/view_model/save_order_input_model.dart';

class SaveOrderInputModelMapper {
  final Map<String, dynamic> _data;

  SaveOrderInputModelMapper(String data) : _data = jsonDecode(data);

  SaveOrderInputModel mapper() {
    return SaveOrderInputModel(
      userId: _data['userId'],
      address: _data['address'],
      paymentType: _data['paymentType'],
      itemsId: List<int>.from(_data['itemsId']),
    );
  }
}
