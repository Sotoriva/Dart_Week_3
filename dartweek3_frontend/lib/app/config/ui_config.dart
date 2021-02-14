import 'package:dartweek3_frontend/app/modules/home/home_bindings.dart';
import 'package:dartweek3_frontend/app/modules/home/home_page.dart';
import 'package:dartweek3_frontend/app/modules/login/login_bindings.dart';
import 'package:dartweek3_frontend/app/modules/login/login_page.dart';
import 'package:dartweek3_frontend/app/modules/order/order_bindings.dart';
import 'package:dartweek3_frontend/app/modules/order/order_page.dart';
import 'package:dartweek3_frontend/app/modules/register/register_bindings.dart';
import 'package:dartweek3_frontend/app/modules/register/register_page.dart';
import 'package:dartweek3_frontend/app/modules/splash/splash_bindings.dart';
import 'package:dartweek3_frontend/app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiConfig {
  UiConfig._();

  static final appTheme = ThemeData(
    primaryColor: Color(0xFF9D0000),
    primarySwatch: Colors.red,
  );

  static final routes = <GetPage>[
    GetPage(
        name: SplashPage.ROUTE_PAGE,
        page: () => SplashPage(),
        binding: SplashBindings()),
    GetPage(
        name: LoginPage.ROUTE_PAGE,
        page: () => LoginPage(),
        binding: LoginBindings()),
    GetPage(
        name: HomePage.ROUTE_PAGE,
        page: () => HomePage(),
        binding: HomeBindings()),
    GetPage(
        name: OrderPage.ROUTE_PAGE,
        page: () => OrderPage(),
        binding: OrderBindings()),
    GetPage(
        name: RegisterPage.ROUTE_PAGE,
        page: () => RegisterPage(),
        binding: RegisterBindings()),
  ];
}
