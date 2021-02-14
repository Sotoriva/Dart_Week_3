import 'dart:async';
import 'dart:convert';
import 'package:dartweek3_backend/modules/order/controller/mapper/save_order_input_model_mapper.dart';
import 'package:dartweek3_backend/services/order/i_order_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'order_controller.g.dart';

@Injectable()
class OrderController {
  final IOrderService _service;

  OrderController(this._service);

  @Route.post('/')
  Future<Response> saveOrder(Request request) async {
    try {
      final inputModel =
          SaveOrderInputModelMapper(await request.readAsString()).mapper();
      await _service.saveOrder(inputModel);
      return Response.ok('');
    } catch (e) {
      print(e);
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao salvar order'}),
      );
    }
  }

  @Route.get('/user/<userId>')
  Future<Response> find(Request request, String userId) async {
    final orders = await _service.findOrder(int.parse(userId));
    final orderResponse = orders.map((o) => o.toMap()).toList();

    return Response.ok(jsonEncode(orderResponse));
  }

  Router get router => _$OrderControllerRouter(this);
}
