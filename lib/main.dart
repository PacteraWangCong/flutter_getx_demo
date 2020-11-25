import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/config/app_routes.dart';
import 'package:fluttergetxdemo/controllers/app_service.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: false,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      onInit: () async {
        Get.lazyPut(() => AppService());
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
        Get.find<AppService>().routeNameChange(Get.routing?.current ?? '');
      });
    }
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    if (route is MaterialPageRoute || route is GetPageRoute) {
      Future.delayed(Duration(milliseconds: 100), () {
        Get.find<AppService>().routeNameChange(Get.routing?.current ?? '');
      });
    }
  }
}
