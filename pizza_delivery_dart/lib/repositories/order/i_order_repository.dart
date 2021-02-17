import 'package:pizza_delivery/entities/order.dart';
import 'package:pizza_delivery/modules/order/view_model/save_order_input_model.dart';

abstract class IOrderRepository {
  Future<void> saveOrder(SaveOrderInputModel saveOrder);
  Future<List<Order>> findOrder(int userId);
}
