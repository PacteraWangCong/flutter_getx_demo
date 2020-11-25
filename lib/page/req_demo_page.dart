import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttergetxdemo/controllers/req_demo_controller.dart';

class ReqDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReqDemoController>(
      init: ReqDemoController(),
      builder: (controller) {
        return Scaffold(
          appBar: CupertinoNavigationBar(
            middle: Text('req demo'),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text('reload ng', style: TextStyle(color: Colors.black)),
              onPressed: () {
                controller.reloadNg();
              },
            ),
          ),
          body: Obx(() {
            final result = controller.reqResult?.value;
            if (result?.success == true) {
              /// 请求成功画面显示
              return _okView(result.data);
            } else if (result?.success == false) {
              /// 请求失败画面显示
              return _ngView(result.error);
            } else {
              /// 初次没有数据画面显示
              return _initView();
            }
          }),
        );
      },
    );
  }
}

extension ReqDemoPageExtension on ReqDemoPage {
  Widget _initView() {
    return Center(
      child: Text(
        '初始画面显示',
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  Widget _okView(List<ReqDemoModel> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final itemData = list[index];
          return Column(
            children: [
              Container(
                height: 60,
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(itemData.title),
                    Text(itemData.info),
                  ],
                ),
              ),
              Container(height: 0.5, color: Colors.grey),
            ],
          );
        });
  }

  Widget _ngView(String errorMsg) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(errorMsg, style: TextStyle(fontSize: 20)),
          SizedBox(height: 30),
          RaisedButton(
            child: Text('reload ok'),
            onPressed: () {
              Get.find<ReqDemoController>().reloadOk();
            },
          )
        ],
      ),
    );
  }
}
