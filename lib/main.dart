import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/config/app_routes.dart';
import 'package:fluttergetxdemo/controllers/app_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      onInit: () {
        Get.put(AppController());
      },
      navigatorObservers: [MyObserver()],
    );
  }
}

/// 监听路由发生变化
class MyObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    if (route is MaterialPageRoute || route is GetPageRoute) {
      Future.delayed(Duration(milliseconds: 100), () {
        Get.find<AppController>().routeNameChange(Get.routing?.current ?? '');
      });
    }
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    if (route is MaterialPageRoute || route is GetPageRoute) {
      Future.delayed(Duration(milliseconds: 100), () {
        Get.find<AppController>().routeNameChange(Get.routing?.current ?? '');
      });
    }
  }
}
