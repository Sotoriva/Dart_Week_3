import 'package:pizza_delivery/app/components/botao.dart';
import 'package:pizza_delivery/app/components/input.dart';
import 'package:pizza_delivery/app/modules/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  static const String ROUTE_PAGE = '/register';

  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.mediaQuery.size.width,
          child: ListView(
            children: [
              Image.asset('assets/images/logo.png', width: 250, height: 250),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputText(
                        controller: nameEditingController,
                        label: "Nome",
                        validator: (String value) {
                          if (value == null || value.isBlank) {
                            return 'Nome é obrigatório!';
                          }
                          return null;
                        },
                      ),
                      InputText(
                        controller: emailEditingController,
                        label: "Email",
                        validator: (String value) {
                          if (value == null || value.isBlank || !value.isEmail) {
                            return 'Email inválido!';
                          }
                          return null;
                        },
                      ),
                      Obx(
                        () => InputText(
                          controller: passwordEditingController,
                          label: "Senha",
                          suffixIcon: Icon(FontAwesome.key),
                          suffixIconOnPressed: controller.showHidePassword,
                          obscureText: controller.obscureTextPassword,
                          validator: (String value) {
                            if (value.length < 6) {
                              return 'A senha deve contém no mínimo 6 caracteres!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Obx(
                        () => InputText(
                          controller: confirmPasswordEditingController,
                          label: "Confirmar Senha",
                          suffixIcon: Icon(FontAwesome.key),
                          suffixIconOnPressed: controller.showHideConfirmPassword,
                          obscureText: controller.obscureTextConfirmPassword,
                          validator: (String value) {
                            if (value != passwordEditingController.text) {
                              return 'A senha de confirmação deve ser igual a senha!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Botao(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            final name = nameEditingController.text;
                            final email = emailEditingController.text;
                            final password = passwordEditingController.text;
                            controller.registerUser(name, email, password);
                          }
                        },
                        width: Get.mediaQuery.size.width * .8,
                        height: 50,
                        buttonColor: Get.theme.primaryColor,
                        label: "Cadastrar",
                        labelSize: 20,
                        labelColor: Colors.white,
                      ),
                      SizedBox(height: 20),
                      Botao(
                        onPressed: () => Get.back(),
                        width: Get.mediaQuery.size.width * .8,
                        height: 50,
                        buttonColor: Colors.grey,
                        label: "Voltar",
                        labelSize: 20,
                        labelColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
