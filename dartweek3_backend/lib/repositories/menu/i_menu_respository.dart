import 'package:dartweek3_backend/entities/menu.dart';

abstract class IMenuRepository {
  Future<List<Menu>> findAll();
}