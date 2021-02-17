import 'package:pizza_delivery/app/helpers/rest_client.dart';
import 'package:pizza_delivery/app/models/order_model.dart';
import 'package:pizza_delivery/app/view_models/checkout_input_model.dart';

class OrderRepository {
  final RestClient _restClient;

  OrderRepository(this._restClient);

  Future<List<OrderModel>> findMyOrders(int userId) async {
    final response = await _restClient.get('/order/user/$userId', decoder: (resp) {
      if (resp is List) {
        return resp.map<OrderModel>((o) => OrderModel.fromMap(o)).toList();
      }
      return null;
    });

    if (response.hasError) {
      print(response.statusText);
      throw RestClientException('Erro ao buscar pedidos!');
    }

    return response.body;
  }

  void saveOrder(CheckoutInputModel model) async {
    switch (model.paymentType) {
      case 'Cartao de Crédito':
        model.paymentType = 'credito';
        break;
      case 'Cartao de Débito':
        model.paymentType = 'debito';
        break;
      case 'Dinheiro':
        model.paymentType = 'dinheiro';
        break;
      default:
    }

    final response = await _restClient.post('/order/', model.toMap());

    if (response.hasError) {
      print(response.statusText);
      throw RestClientException('Erro ao registrar pedido!');
    }

    return response.body;
  }
}
