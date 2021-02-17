import 'package:pizza_delivery/app/helpers/messages_mixin.dart';
import 'package:pizza_delivery/app/models/menu_item_model.dart';
import 'package:pizza_delivery/app/models/menu_model.dart';
import 'package:pizza_delivery/app/modules/shoppingCard/shopping_card_controller.dart';
import 'package:pizza_delivery/app/modules/shoppingCard/shopping_card_page.dart';
import 'package:pizza_delivery/app/repositories/menu_repository.dart';
import 'package:pizza_delivery/app/repositories/order_repository.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MenuController extends GetxController with MessagesMixin {
  final MenuRepository _repository;
  final _menu = <MenuModel>[].obs;
  final _flavorsSelected = <MenuItemModel>[].obs;
  final _message = Rx<MessageModel>();

  List<MenuModel> get menu => _menu;
  List<MenuItemModel> get flavoursSelected => _flavorsSelected;
  double get totalValue => _flavorsSelected.fold(0, (value, item) => value += item.price);

  MenuController(this._repository);

  @override
  Future<void> onInit() async {
    super.onInit();
    final menuData = await _repository.findAll();
    _menu.assignAll(menuData);
    messageListener(_message);
  }

  void addItem(MenuItemModel item) {
    if (_flavorsSelected.contains(item)) {
      _flavorsSelected.remove(item);
      _message(
        MessageModel('Item removido!', '${item.name} R\$${item.price}', MessageType.info), //TODO: add format money
      );
    } else {
      _flavorsSelected.add(item);
      _message(
        MessageModel('Item adicionado!', '${item.name} R\$${item.price}', MessageType.info),
      );
    }
  }

  Future<void> goToShoppingCard() async {
    Get.put(OrderRepository(Get.find()));
    Get.put(ShoppingCardController(_flavorsSelected, Get.find()));
    await showBarModalBottomSheet(
      context: Get.context,
      isDismissible: false,
      builder: (_) {
        return ShoppingCardPage();
      },
    );
    Get.delete<OrderRepository>();
    Get.delete<ShoppingCardController>();
  }
}
