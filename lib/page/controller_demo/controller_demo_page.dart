import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/config/app_routes.dart';
import 'package:fluttergetxdemo/page/home_page.dart';
import 'controller_demo_a_page.dart';

class ControllerDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('controller demo')),
      body: ListView(
        children: [
          HomeBtn(
            title: 'conroller global',
            description: '//演示一个作用全局的controller',
            clickedAction: () {
              AppRoutes.push(ControllerDemoAPage(global: true));
            },
          ),
          HomeBtn(
            title: 'conroller not global',
            description: '//演示一个作用非全局的controller',
            clickedAction: () {
              AppRoutes.push(ControllerDemoAPage(global: false));
            },
          ),
        ],
      ),
    );
  }
}
