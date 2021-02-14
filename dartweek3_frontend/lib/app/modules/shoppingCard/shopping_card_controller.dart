import 'package:dartweek3_frontend/app/helpers/loader_mixin.dart';
import 'package:dartweek3_frontend/app/helpers/messages_mixin.dart';
import 'package:dartweek3_frontend/app/models/menu_item_model.dart';
import 'package:dartweek3_frontend/app/models/user_model.dart';
import 'package:dartweek3_frontend/app/repositories/order_repository.dart';
import 'package:dartweek3_frontend/app/view_models/checkout_input_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCardController extends GetxController
    with MessagesMixin, LoaderMixin {
  final OrderRepository _repository;
  final RxList<MenuItemModel> flavoursSelected;

  ShoppingCardController(this.flavoursSelected, this._repository);

  final _user = Rx<UserModel>();
  final _address = ''.obs;
  final _paymentType = ''.obs;
  final addressEditingController = TextEditingController();
  final paymentTypeEditingController = TextEditingController();
  final _message = Rx<MessageModel>();
  final _loading = false.obs;

  String get userName => _user.value?.name ?? '';
  double get totalPrice =>
      flavoursSelected.fold(0, (total, item) => total += item.price);
  String get address => _address.value;
  String get paymentType => _paymentType.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    final sp = await SharedPreferences.getInstance();
    _user(UserModel.fromJson(sp.getString('user')));
    messageListener(_message);
    loaderListener(_loading);
  }

  Future<void> changeAddress() async {
    await Get.defaultDialog(
      title: 'Endereço de entrega',
      content: TextField(
        controller: addressEditingController,
      ),
      cancel: RaisedButton(
        color: Get.theme.primaryColor,
        onPressed: () => Get.back(),
        child: Text('Cancelar'),
        textColor: Colors.white,
      ),
      confirm: RaisedButton(
        color: Get.theme.primaryColor,
        onPressed: () {
          _address(addressEditingController.text);
          addressEditingController.clear();
          Get.back();
        },
        child: Text('Alterar'),
        textColor: Colors.white,
      ),
    );
  }

  Future<void> changePaymentType() async {
    await Get.defaultDialog(
      title: 'Forma de pagamento',
      content: RadioButtonGroup(
        labels: [
          'Cartão de crédito',
          'Cartão de débito',
          'Dinheiro',
        ],
        onSelected: (String value) => _paymentType(value),
      ),
      cancel: RaisedButton(
        color: Get.theme.primaryColor,
        onPressed: () => Get.back(),
        child: Text('Cancelar'),
        textColor: Colors.white,
      ),
      confirm: RaisedButton(
        color: Get.theme.primaryColor,
        onPressed: () => Get.back(),
        child: Text('Alterar'),
        textColor: Colors.white,
      ),
    );
  }

  Future<void> checkout() async {
    if (address.isBlank) {
      _message(
        MessageModel(
            'Erro', 'Endereço de entrega obrigatório!', MessageType.error),
      );
    } else if (paymentType.isBlank) {
      _message(
        MessageModel(
            'Erro', 'Forma de pagamento obrigatória!', MessageType.error),
      );
    } else {
      try {
        _loading(true);
        await _repository.saveOrder(CheckoutInputModel(
          userId: _user.value.id,
          address: address,
          paymentType: paymentType,
          itemsId: flavoursSelected.map<int>((f) => f.id).toList(),
        ));
        _loading(false);
        _message(
          MessageModel(
              'Sucesso', 'Pedido gerado com sucesso!', MessageType.info),
        );
        await 1.seconds.delay();
        Get.close(3);
      } catch (e) {
        print(e);
        _loading(false);
        _message(
            MessageModel('Erro', 'Erro ao gerar pedido!', MessageType.error));
      }
    }
  }
}
