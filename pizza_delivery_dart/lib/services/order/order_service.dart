import 'package:pizza_delivery/entities/order.dart';
import 'package:pizza_delivery/modules/order/view_model/save_order_input_model.dart';
import 'package:pizza_delivery/repositories/order/i_order_repository.dart';
import 'package:pizza_delivery/services/order/i_order_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IOrderService)
class OrderService implements IOrderService {
  final IOrderRepository _repository;

  OrderService(this._repository);

  @override
  Future<void> saveOrder(SaveOrderInputModel saveOrder) async {
    await _repository.saveOrder(saveOrder);
  }

  @override
  Future<List<Order>> findOrder(int userId) async {
    return await _repository.findOrder(userId);
  }
}
