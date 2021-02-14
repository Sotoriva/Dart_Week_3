import 'package:dartweek3_backend/application/routers/i_router_configure.dart';
import 'package:dartweek3_backend/modules/users/controller/user_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';

class UsersRouter implements IRouterConfigure {
  @override
  void configure(Router router) {
    final userController = GetIt.I.get<UserController>();
    router.mount('/user/', userController.router);
  }
}