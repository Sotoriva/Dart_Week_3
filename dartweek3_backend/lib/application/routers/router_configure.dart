import 'package:dartweek3_backend/application/routers/i_router_configure.dart';
import 'package:dartweek3_backend/modules/menu/menu_router.dart';
import 'package:dartweek3_backend/modules/order/order_router.dart';
import 'package:dartweek3_backend/modules/users/users_router.dart';
import 'package:shelf_router/src/router.dart';

class RouterConfigure {
  final Router _router;
  final List<IRouterConfigure> routers = [
    UsersRouter(),
    MenuRouter(),
    OrderRouter(),
  ];

  RouterConfigure(this._router);

  void configure() => routers.forEach((element) => element.configure(_router));
}
