import 'package:pizza_delivery/application/database/i_database_connection.dart';
import 'package:pizza_delivery/application/exceptions/database_error_exception.dart';
import 'package:pizza_delivery/entities/menu_item.dart';
import 'package:pizza_delivery/entities/order.dart';
import 'package:pizza_delivery/entities/order_item.dart';
import 'package:pizza_delivery/modules/order/view_model/save_order_input_model.dart';
import 'package:pizza_delivery/repositories/order/i_order_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

@LazySingleton(as: IOrderRepository)
class OrderRepository implements IOrderRepository {
  final IDatabaseConnection _connection;

  OrderRepository(this._connection);

  @override
  Future<void> saveOrder(SaveOrderInputModel saveOrder) async {
    final conn = await _connection.openConnection();
    try {
      await conn.transaction((_) async {
        final resultOrder = await conn.query(
          ''' INSERT INTO pedido(id_usuario, forma_pagamento, endereco_entrega) VALUES (?,?,?) ''',
          [saveOrder.userId, saveOrder.paymentType, saveOrder.address],
        );

        final orderId = resultOrder.insertId;

        await conn.queryMulti(
          ''' INSERT INTO pedido_item(id_pedido, id_cardapio_grupo_item) values(?,?) ''',
          saveOrder.itemsId.map((item) => [orderId, item]),
        );
      });
    } on MySqlException catch (e) {
      print(e);
      throw DatabaseErrorException(message: 'Erro ao inserir order');
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<List<Order>> findOrder(int userId) async {
    final conn = await _connection.openConnection();
    final orders = <Order>[];

    try {
      final ordersResult = await conn.query(''' SELECT * FROM pedido WHERE id_usuario = ? ''', [userId]);

      if (ordersResult.isNotEmpty) {
        for (var orderResult in ordersResult) {
          final orderData = orderResult.fields;

          final orderItemsResult = await conn.query(
            ''' SELECT p.id_pedido_item, item.id_cardapio_grupo_item, item.nome, item.valor 
              FROM pedido_item p INNER JOIN cardapio_grupo_item item ON item.id_cardapio_grupo_item = p.id_cardapio_grupo_item WHERE p.id_pedido = ? ''',
            [orderData['id_pedido']],
          );

          final items = orderItemsResult.map<OrderItem>((item) {
            final itemFields = item.fields;

            return OrderItem(
              id: itemFields['id_pedido_item'],
              item: MenuItem(
                id: itemFields['id_cardapio_grupo_item'] as int,
                name: itemFields['nome'] as String,
                price: itemFields['valor'] as double,
              ),
            );
          }).toList();

          final order = Order(
            id: orderData['id_pedido'] as int,
            address: (orderData['endereco_entrega'] as Blob).toString(),
            paymentType: orderData['forma_pagamento'] as String,
            items: items,
          );

          orders.add(order);
        }
      }
      return orders;
    } on MySqlException catch (e) {
      print(e);
      throw DatabaseErrorException(message: 'Erro ao buscar order');
    }
  }
}
