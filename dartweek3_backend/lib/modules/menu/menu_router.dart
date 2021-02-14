import 'package:dartweek3_backend/application/routers/i_router_configure.dart';
import 'package:dartweek3_backend/modules/menu/controller/menu_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';

class MenuRouter implements IRouterConfigure {
  @override
  void configure(Router router) {
    router.mount('/menu/', GetIt.I.get<MenuController>().router);
  }
}
