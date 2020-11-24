import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/controllers/app_controller.dart';
import 'package:get/get.dart';

extension EXBuildContext on BuildContext {
  static Map<int, Worker> workedMap = {};

  /// 用于监听画面的每次显示
  /// 监听的[BuildContext]必须有路由
  /// 配合[StatelessWidget]和[GetBuilder]使用，[GetBuilder]dispose时执行disposeWorker()
  void didAppearCallBack(VoidCallback didAppearCallBack) {
    if (Get.isRegistered<AppController>() && this != null) {
      final appController = Get.find<AppController>();
      final worker = interval(
        appController.routeNameObs,
        (routeName) {
          if (this != null && this.findRenderObject().attached) {
            final route = ModalRoute.of(this);
            if (route.isCurrent) {
              if (didAppearCallBack != null) {
                didAppearCallBack();
              }
            }
          }
        },
        time: Duration(milliseconds: 100),
      );
      EXBuildContext.workedMap[this.hashCode] = worker;
    }
  }

  void disposeWorker() {
    if (EXBuildContext.workedMap.containsKey(this.hashCode)) {
      final worked = EXBuildContext.workedMap[this.hashCode];
      if (!worked.isNull) {
        worked.dispose();
      }
      EXBuildContext.workedMap.remove(this.hashCode);
    }
  }
}
