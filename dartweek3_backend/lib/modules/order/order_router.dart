import 'package:dartweek3_backend/application/routers/i_router_configure.dart';
import 'package:dartweek3_backend/modules/order/controller/order_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';

class OrderRouter implements IRouterConfigure {
  @override
  void configure(Router router) {
    router.mount('/order/', GetIt.I.get<OrderController>().router);
  }
}
