import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/config/app_routes.dart';
import 'package:get/get.dart';

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
              Get.toNamed(AppRoutes.controllerDemo);
            },
          )
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
    return Column(
      children: [
        SizedBox(height: 20),
        Text(description, style: TextStyle(fontSize: 18, color: Colors.green)),
        RaisedButton(
          child: Text(title),
          onPressed: () {
            clickedAction();
          },
        )
      ],
    );
  }
}
