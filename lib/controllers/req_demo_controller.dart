import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// 请求返回的数据
class Result<T, E> {
  bool success;
  T data;
  E error;
  Result(this.success, {this.data, this.error});
}

class ReqDemoModel {
  final String title;
  final String info;
  final String imageUrl;

  ReqDemoModel({
    this.title = 'title',
    this.info = 'info',
    this.imageUrl = 'imageUrl',
  });
}

class ReqDemoController extends GetxController {
  final reqResult = Rx<Result<List<ReqDemoModel>, String>>();

  @override
  void onInit() {
    reqInit();
    super.onInit();
  }

  /// 初期数据请求
  void reqInit() {
    EasyLoading.show();
    Future.delayed(Duration(seconds: 1), () {
      reqResult.value = Result(true, data: getDemoList());
      EasyLoading.dismiss();
    });
  }
}

/// demo 方法
extension ReqDemoControllerDemo on ReqDemoController {
  void reloadOk() {
    EasyLoading.show();
    Future.delayed(Duration(seconds: 1), () {
      reqResult.value = Result(true, data: getDemoList());
      EasyLoading.dismiss();
    });
  }

  void reloadNg() {
    EasyLoading.show();
    Future.delayed(Duration(seconds: 1), () {
      reqResult.value = Result(false, error: 'test 请求失败');
      EasyLoading.dismiss();
    });
  }

  List<ReqDemoModel> getDemoList() {
    List<ReqDemoModel> list = List<ReqDemoModel>();
    for (int i = 0; i < 10; i++) {
      list.add(ReqDemoModel(title: 'title$i', info: 'info $i', imageUrl: ''));
    }
    return list;
  }
}
