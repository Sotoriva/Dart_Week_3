import 'package:dartweek3_backend/entities/menu.dart';

abstract class IMenuService {
  Future<List<Menu>> getAllMenus();
}