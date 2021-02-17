import 'package:pizza_delivery/app/models/user_model.dart';
import 'package:pizza_delivery/app/repositories/order_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController with StateMixin {
  final OrderRepository _repository;

  OrderController(this._repository);

  UserModel _user;

  @override
  Future<void> onInit() async {
    super.onInit();
    final sp = await SharedPreferences.getInstance();
    _user = UserModel.fromJson(sp.getString('user'));
    findOrder();
  }

  Future<void> findOrder() async {
    change([], status: RxStatus.loading());
    try {
      final orders = await _repository.findMyOrders(_user.id);
      change(orders, status: RxStatus.success());
    } catch (e) {
      change('Erro ao buscar pedidos', status: RxStatus.error());
    }
  }
}
