import 'package:fluttergetxdemo/page/controller_demo_page.dart';
import 'package:fluttergetxdemo/page/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/home';
  static const controllerDemo = '/controllerDemo';
  static const controllerDemoA = '/controllerDemo_A';
  static const controllerDemoB = '/controllerDemo_B';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    controllerDemo: (context) => ControllerDemoPage(),
    controllerDemoA: (context) => ControllerDemoAPage(),
    controllerDemoB: (context) => ControllerDemoBPage(),
  };

  static Future<T> push<T>(Widget page, {String routeName, bool fullscreenDialog = false}) {
    return navigator.push<T>(MaterialPageRoute(
      fullscreenDialog: fullscreenDialog,
      settings: RouteSettings(name: routeName ?? getDefaultRouteName(page)),
      builder: (context) {
        return page;
      },
    ));

    /// *navigator other 例子..*
    /// navigator.pop();
    /// navigator.pushNamed('routeName');
  }


  static String getDefaultRouteName(Widget page) {
    return "/${page.runtimeType.toString()}";
  }
}
