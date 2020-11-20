import 'package:fluttergetxdemo/page/controller_demo/controller_demo_b_page.dart';
import 'package:fluttergetxdemo/page/controller_demo/controller_demo_a_page.dart';
import 'package:fluttergetxdemo/page/controller_demo/controller_demo_page.dart';
import 'package:fluttergetxdemo/page/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/home';
  static const controllerDemo = '/controllerDemo';
  static const controllerDemoA = '/controllerDemo_A';
  static const controllerDemoB = '/controllerDemo_B';

  static final routes = [
    GetPage(
      name: home,
      page: () => HomePage(),
    ),
    GetPage(
      name: controllerDemo,
      page: () => ControllerDemoPage(),
    ),
    GetPage(
      name: controllerDemoA,
      page: () => ControllerDemoAPage(),
    ),
    GetPage(
      name: controllerDemoB,
      page: () => ControllerDemoBPage(),
    ),
  ];

  static Future<T> push<T>(Widget page, {String routeName, bool fullscreenDialog = false}) {
    return navigator.push<T>(MaterialPageRoute(
      fullscreenDialog: fullscreenDialog,
      builder: (context) {
        return page;
      },
    ));
  }
}
