import 'package:pizza_delivery/app/components/bottom_navigation.dart';
import 'package:pizza_delivery/app/models/order_model.dart';
import 'package:pizza_delivery/app/modules/order/order_controller.dart';
import 'package:pizza_delivery/app/modules/order/widgets/history_panel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends GetView<OrderController> {
  static const String ROUTE_PAGE = '/order';
  static const int NAVIGATION_BAR_INDEX = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Pedidos')),
      bottomNavigationBar: PizzaBottomNavigation(NAVIGATION_BAR_INDEX),
      body: LayoutBuilder(
        builder: (context, constructor) {
          return RefreshIndicator(
            onRefresh: () async => controller.findOrder(),
            child: ListView(
              children: [
                SizedBox(
                  height: constructor.maxHeight,
                  child: controller.obx(
                    (state) => _makeOrder(state),
                    onError: (_) => Center(
                      child: Text('Erro ao buscar pedidos'),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Visibility _makeOrder(List<OrderModel> state) {
    return Visibility(
      visible: state.length > 0,
      replacement: Container(
        padding: EdgeInsets.all(8),
        child: Text(
          'Nenhum pedido',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.length,
        itemBuilder: (context, index) {
          return HistoryPanel(state[index]);
        },
      ),
    );
  }
}
