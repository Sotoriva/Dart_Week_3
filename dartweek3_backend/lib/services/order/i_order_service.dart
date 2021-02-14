import 'package:dartweek3_backend/entities/order.dart';
import 'package:dartweek3_backend/modules/order/view_model/save_order_input_model.dart';

abstract class IOrderService {
  Future<void> saveOrder(SaveOrderInputModel saveOrder);
  Future<List<Order>> findOrder(int userId);
}
