import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/config/app_routes.dart';
import 'controller_demo_page.dart';
import 'appear_demo_page.dart';
import 'req_demo_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX')),
      body: ListView(
        children: [
          HomeBtn(
            title: 'controller demo',
            description: '//了解controller生命周期和作用范围的demo',
            clickedAction: () {
              AppRoutes.push(ControllerDemoPage());
            },
          ),
          HomeBtn(
            title: 'req demo',
            description: '//api请求刷新页面的代码格式\n//使用异步延迟模仿api请求 \n //实际api请求写法请参考 minefocus_base_flutter',
            clickedAction: () {
              AppRoutes.push(ReqDemoPage());
            },
          ),
          HomeBtn(
            title: 'page appear demo',
            description: '//画面每次显示事件',
            clickedAction: () {
              AppRoutes.push(AppearDemoAPage());
            },
          ),
        ],
      ),
    );
  }
}

class HomeBtn extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback clickedAction;

  const HomeBtn({
    Key key,
    this.title,
    this.description,
    this.clickedAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(description, style: TextStyle(fontSize: 16, color: Colors.green)),
          RaisedButton(
            child: Text(title),
            onPressed: () {
              clickedAction();
            },
          )
        ],
      ),
    );
  }
}
