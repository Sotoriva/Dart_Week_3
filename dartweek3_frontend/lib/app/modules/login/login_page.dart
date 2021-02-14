import 'package:dartweek3_frontend/app/components/botao.dart';
import 'package:dartweek3_frontend/app/components/input.dart';
import 'package:dartweek3_frontend/app/modules/login/login_controller.dart';
import 'package:dartweek3_frontend/app/modules/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  static const String ROUTE_PAGE = '/login';

  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
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
                padding: EdgeInsets.all(8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputText(
                        controller: emailEditingController,
                        label: "Email",
                        validator: (String value) {
                          if (value == null ||
                              value.isBlank ||
                              !value.isEmail) {
                            return 'Email inválido!';
                          }
                          return null;
                        },
                      ),
                      Obx(
                        () => InputText(
                          controller: passwordEditingController,
                          label: "Password",
                          suffixIcon: Icon(FontAwesome.key),
                          suffixIconOnPressed: controller.showHidePassword,
                          obscureText: controller.obscureText,
                          validator: (String value) {
                            // if (value.length < 6) {
                            if (value.length < 5) {
                              return 'Password deve contém no mínimo 6 caracteres!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Botao(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            final email = emailEditingController.text;
                            final password = passwordEditingController.text;
                            controller.login(email, password);
                          }
                        },
                        width: Get.mediaQuery.size.width * .8,
                        height: 50,
                        buttonColor: Get.theme.primaryColor,
                        label: "Entrar",
                        labelSize: 20,
                        labelColor: Colors.white,
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () => Get.toNamed(RegisterPage.ROUTE_PAGE),
                        child: Text(
                          "cadastre-se",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
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
