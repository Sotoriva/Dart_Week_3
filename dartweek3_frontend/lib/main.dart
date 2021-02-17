import 'package:pizza_delivery/app/config/application_bindings.dart';
import 'package:pizza_delivery/app/config/ui_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: UiConfig.appTheme,
      debugShowCheckedModeBanner: false,
      getPages: UiConfig.routes,
      initialBinding: ApplicationBindings(),
    );
  }
}
