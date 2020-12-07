import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/controllers/app_service.dart';
import 'package:get/get.dart';

extension MFContextExtension on BuildContext {
  static Map<int, Worker> workedMap = {};

  /// 用于监听画面的每次显示
  /// 监听的[BuildContext]必须有路由
  /// 配合[StatelessWidget]和[GetBuilder]使用，[GetBuilder]dispose时执行disposeWorker()
  void didAppearCallBack(VoidCallback didAppearCallBack) {
    if (Get.isRegistered<AppService>() && this != null) {
      final appController = Get.find<AppService>();
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
      MFContextExtension.workedMap[this.hashCode] = worker;
    }
  }

  void disposeWorker() {
    if (MFContextExtension.workedMap.containsKey(this.hashCode)) {
      final worked = MFContextExtension.workedMap[this.hashCode];
      if (!worked.isNull) {
        worked.dispose();
      }
      MFContextExtension.workedMap.remove(this.hashCode);
    }
  }
}
