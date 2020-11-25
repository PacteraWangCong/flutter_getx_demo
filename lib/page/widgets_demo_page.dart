import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/mf_widgets/mf_pop_alert.dart';
import 'home_page.dart';
import 'package:get/get.dart';

class WidgetsDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int snackBarCount = 0;

    return Scaffold(
      appBar: AppBar(title: Text('widgets demo')),
      body: ListView(
        children: [
          HomeBtn(
            title: 'Get snackbar demo',
            description: '//类似push通知顶部弹出pop',
            clickedAction: () {
              snackBarCount += 1;
              Get.snackbar(
                'notice $snackBarCount',
                'this is a message $snackBarCount',
                onTap: (snack) {
                  print('clicked notice $snackBarCount');
                },
              );
            },
          ),
          HomeBtn(
            title: 'Get Default Dialog demo',
            description: '//Get 默认 Dialog',
            clickedAction: () {
              Get.defaultDialog(
                title: 'Dialog',
                middleText: 'this is a message',
                textConfirm: 'ok',
                textCancel: 'cancel',
                confirmTextColor: Colors.white,
                barrierDismissible: false,
              );
            },
          ),
          HomeBtn(
            title: 'Get Custom Dialog demo',
            description: '//Get 自定义 Dialog',
            clickedAction: () {
              Get.dialog(
                MFPopAlert.title(
                  'custom alert',
                  description: 'this is a message',
                  okTitle: 'ok',
                  cancelTitle: 'cancel',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
